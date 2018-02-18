//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/13/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
  var appdata = AppData.shared
  /*
  var questionIndex : Int?
  var currAnswer : String?
  var correctAnswer : String?
  var currentSubject : String?
  var totalQuestions : Int?
  var answeredCorrect : Int?
  */
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var validityLabel: UILabel!
  
  override func viewDidLoad() {
      super.viewDidLoad()
    /*
    answerLabel.text = correctAnswer
    questionLabel.text = appdata.getQs()[currentSubject!]?[questionIndex!]
    if currAnswer != correctAnswer {
      validityLabel.text = "False!"
    } else {
      validityLabel.text = "Correct!"
      answeredCorrect = answeredCorrect! + 1
    }
    */
  }
  
  /*
  @IBAction func chooseNextScene(_ sender: Any) {
    if self.questionIndex! + 1 < (appdata.getQs()[currentSubject!]?.count)! {
      performSegue(withIdentifier: "nextQuestion", sender: self)
    } else {
      performSegue(withIdentifier: "showResults", sender: self)
    }
  }
  */
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "nextQuestion") {
      let questionController = segue.destination as! QuestionViewController
      /*
      questionController.questionIndex = self.questionIndex! + 1
      questionController.currentSubject = self.currentSubject
      questionController.totalQuestions = self.totalQuestions! + 1
      questionController.answeredCorrect = self.answeredCorrect
      */
    } else {
      let resultsController = segue.destination as! ResultsViewController
      /*
      resultsController.answeredCorrect = self.answeredCorrect
      resultsController.totalQuestions = self.totalQuestions
      */
    }
  }
}
