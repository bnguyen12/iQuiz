//
//  ViewController.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/10/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var appdata = AppData.shared
  @IBOutlet weak var myTable: UITableView!
  var url = String()
  /*
  var currentSubject = ""
  var questionIndex = 0
  var totalQuestions = 1
  var answeredCorrect = 0
  */
  override func viewDidLoad() {
    super.viewDidLoad()
    myTable.tableFooterView = UIView()
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return appdata.getSubjects().count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      as! CustomTableViewCell
    cell.myImage.image = UIImage(named: appdata.getSubjects()[indexPath.row])
    cell.myLbl.text = appdata.getSubjects()[indexPath.row]
    cell.myDescrip.text = appdata.getDescrip()[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //currentSubject = appdata.getSubjects()[indexPath.row]
    performSegue(withIdentifier: "segue", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let questionController = segue.destination as! QuestionViewController
    /*
    questionController.currentSubject = self.currentSubject
    questionController.questionIndex = self.questionIndex
    questionController.answeredCorrect = self.answeredCorrect
    questionController.totalQuestions = self.totalQuestions
    */
  }
  
  //Make popup for alerts
  @IBAction func settingAlert(_ sender: Any) {
    let alert = UIAlertController(title: "Retrieve JSON", message: "Type in a valid URL",
                                  preferredStyle: .alert)
    alert.addTextField { (textField : UITextField!) -> Void in
      textField.placeholder = "Enter URL"
    }
    alert.addAction(UIAlertAction(title: "check now", style: .default, handler: { [weak alert] (_) in
      let textField = alert!.textFields![0]
      self.url = textField.text!
    }))
    self.present(alert, animated: true, completion: nil)
  }
}

