//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/13/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
  var jsonData : [[String: Any]]?
  var questions : [[String: Any]]?
  var answers : [String]?
  var questionIndex : Int?
  var currAnswer : Int?
  var currentSubject : Int?
  var totalQuestions : Int?
  var answeredCorrect : Int?
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var validityLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let realAns = (questions![questionIndex!]["answer"] as! NSString).integerValue - 1
    answerLabel.text = answers![realAns]
    questionLabel.text = (questions![questionIndex!]["text"] as! String)
    if currAnswer != realAns {
      validityLabel.text = "False!"
    } else {
      validityLabel.text = "Correct!"
      answeredCorrect = answeredCorrect! + 1
    }
  }
  
  //Either show the next question or show results
  @IBAction func chooseNextScene(_ sender: Any) {
    if self.questionIndex! + 1 < (questions?.count)! {
      performSegue(withIdentifier: "nextQuestion", sender: self)
    } else {
      performSegue(withIdentifier: "showResults", sender: self)
    }
  }
  
  //Send variables through next segue
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "nextQuestion") {
      let questionController = segue.destination as! QuestionViewController
      questionController.jsonData = self.jsonData
      questionController.questionIndex = self.questionIndex! + 1
      questionController.currentSubject = self.currentSubject
      questionController.totalQuestions = self.totalQuestions! + 1
      questionController.answeredCorrect = self.answeredCorrect
    } else {
      let resultsController = segue.destination as! ResultsViewController
      resultsController.answeredCorrect = self.answeredCorrect
      resultsController.totalQuestions = self.totalQuestions
      resultsController.jsonData = self.jsonData
    }
  }
}
