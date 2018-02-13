//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/12/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

  @IBOutlet weak var question: UILabel!
  @IBOutlet weak var questionTable: UITableView!
  var appdata = AppData.shared
  var currentSubject : String?
  var currAnswer : String?
  var currQuestion : String?
  var questionIndex : Int?
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
    cell.answerLabel.text = appdata.getAs()[appdata.getQs()[currentSubject!]![questionIndex!]]?[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    currAnswer = appdata.getAs()[appdata.getQs()[currentSubject!]![questionIndex!]]?[indexPath.row]
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "toAnsScene") {
      let ansController = segue.destination as! AnswerViewController
      let correctAnswer = appdata.getRealAs()[question.text!]
      ansController.questionIndex = self.questionIndex
      ansController.currAnswer = self.currAnswer
      ansController.correctAnswer = correctAnswer
      ansController.currentSubject = self.currentSubject
    }
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      question.text = appdata.getQs()[currentSubject!]?[questionIndex!]
      questionTable.tableFooterView = UIView()
    }
}
