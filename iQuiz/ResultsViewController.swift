//
//  ResultsViewController.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/13/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  @IBOutlet weak var howManyCorrectLabel: UILabel!
  @IBOutlet weak var overallResultLabel: UILabel!
  var totalQuestions : Int?
  var answeredCorrect : Int?
  override func viewDidLoad() {
    super.viewDidLoad()
    if (answeredCorrect! / totalQuestions!) == 1 {
      overallResultLabel.text = "Perfect"
    } else if (Double(answeredCorrect!) / Double(totalQuestions!)) > 0.5 {
      overallResultLabel.text = "Almost!"
    } else {
      overallResultLabel.text = "Not quite..."
    }
    howManyCorrectLabel.text = "You got \(answeredCorrect!) of \(totalQuestions!) correct"
  }

}
