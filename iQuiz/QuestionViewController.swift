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
  var jsonData : [[String: Any]]?
  var currentSubject : Int?
  var questions : [[String: Any]]?
  var answers : [String]?
  var questionIndex : Int?
  var totalQuestions : Int?
  var answeredCorrect : Int?
  var currAnswer : Int?
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if questions == nil {
      questionTable.reloadData()
    } else {
      answers = questions![questionIndex!]["answers"] as! [String]?
    }
    return answers!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
    cell.answerLabel.text = answers?[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    currAnswer = indexPath.row
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "toAnsScene") {
      let ansController = segue.destination as! AnswerViewController
      ansController.questions = self.questions
      ansController.answers = self.answers
      ansController.questionIndex = self.questionIndex
      ansController.currAnswer = self.currAnswer
      ansController.currentSubject = self.currentSubject
      ansController.totalQuestions = self.totalQuestions
      ansController.answeredCorrect = self.answeredCorrect
      ansController.jsonData = self.jsonData
    } else {
      let mainPage = segue.destination as! ViewController
      mainPage.jsonData = self.jsonData!
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    questions = (jsonData![currentSubject!]["questions"]! as! [[String: Any]])
    question.text = (questions![questionIndex!]["text"] as! String)
      questionTable.tableFooterView = UIView()
    }
}
