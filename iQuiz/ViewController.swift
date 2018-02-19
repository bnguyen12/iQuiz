//
//  ViewController.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/10/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var myTable: UITableView!
  var jsonData = [[String: Any]]()
  var currentSubject : Int?
  var questionIndex = 0
  var totalQuestions = 1
  var answeredCorrect = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    myTable.tableFooterView = UIView()
    let fm = FileManager.default
    
    //If there is a local file, use it for this quiz
    let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    let jsonPath = docsurl.appendingPathComponent("jsonData.json")
    if fm.fileExists(atPath: jsonPath.path) {
      print("File found!")
      let fileData = NSData.init(contentsOf: jsonPath)
      let jsonResult = try! JSONSerialization.jsonObject(with: fileData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
      jsonData = jsonResult as! [[String: Any]]
    }
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !jsonData.isEmpty {
      return jsonData.count
    }
    return 0
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      as! CustomTableViewCell
    if !jsonData.isEmpty {
      cell.myImage.image = UIImage(named: jsonData[indexPath.row]["title"] as! String)
      cell.myLbl.text = (jsonData[indexPath.row]["title"] as! String)
      cell.myDescrip.text = (jsonData[indexPath.row]["desc"] as! String)
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    currentSubject = indexPath.row
    performSegue(withIdentifier: "segue", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let questionController = segue.destination as! QuestionViewController
    questionController.jsonData = self.jsonData
    questionController.currentSubject = self.currentSubject
    questionController.questionIndex = self.questionIndex
    questionController.answeredCorrect = self.answeredCorrect
    questionController.totalQuestions = self.totalQuestions
  }
  
  //Popup to get JSON data from URL
  @IBAction func settingAlert(_ sender: Any) {
    var url = String()
    let alert = UIAlertController(title: "Retrieve JSON", message: "Type in a valid URL",
                                  preferredStyle: .alert)
    alert.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Enter URL"
    }
    alert.addAction(UIAlertAction(title: "check now", style: .default, handler: { [weak alert] (_) in
      let textField = alert!.textFields![0]
      url = textField.text!
      self.readJSON(url)
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  //Read JSON file for quiz and answers
  func readJSON(_ url : String) -> Void {
    let jsonURL = URL(string: url)
    let task = URLSession.shared.dataTask(with: jsonURL!) { data, response, error in
      if error != nil {
        print("Download failed")
      } else {
        do {
          if let content = data {
            let jsonResult = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)
            self.writeJSON(content)
            self.jsonData = jsonResult as! [[String: Any]]
          }
        } catch {
          print(error)
        }
        DispatchQueue.main.async() {
          self.myTable.reloadData()
        }
      }
    }
    task.resume()
  }
  
  //Writes json from rawJson into a file named jsonData.json in the documents directory
  func writeJSON(_ rawJson : Any) -> Void {
    let documentsDirectoryPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let documentsDirectoryPath = NSURL(string: documentsDirectoryPathString)!
    let jsonFilePath = documentsDirectoryPath.appendingPathComponent("jsonData.json")
    let fileManager = FileManager.default
    var isDirectory: ObjCBool = false
    
    // creating a .json file in the Documents folder
    if !fileManager.fileExists(atPath: (jsonFilePath?.path)!, isDirectory: &isDirectory) {
      let created = fileManager.createFile(atPath: (jsonFilePath?.path)!, contents: nil, attributes: nil)
      if created {
        print("File created ")
      } else {
        print("Couldn't create file for some reason")
      }
    } else {
      print("File already exists")
    }
    
    //Write raw json file to directory
    do {
      let file = try FileHandle(forWritingTo: jsonFilePath!)
      file.write(rawJson as! Data)
      print("JSON data was written to the file successfully!")
    } catch let error as NSError {
      print("Couldn't write to file: \(error.localizedDescription)")
    }
  }
}

