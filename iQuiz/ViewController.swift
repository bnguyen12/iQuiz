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
  var currentSubject = ""
  var questionIndex = 0
  
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
    currentSubject = appdata.getSubjects()[indexPath.row]
    performSegue(withIdentifier: "segue", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let questionController = segue.destination as! QuestionViewController
      questionController.currentSubject = self.currentSubject
      questionController.questionIndex = self.questionIndex
  }
  
  //Make popup for alerts
  @IBAction func settingAlert(_ sender: Any) {
    let alert = UIAlertController(title: "Settings", message: "Settings go here",
                                  preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,
                                  handler: { (action) in alert.dismiss(animated: true, completion: nil)
    }))
    self.present(alert, animated: true, completion: nil)
  }
}

