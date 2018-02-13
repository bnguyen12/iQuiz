//
//  AppData.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/10/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class AppData : NSObject{
  static let shared = AppData()
  private let subjects : [String] = [
    "Mathematics",
    "Marvel Super Heroes",
    "Science"
  ]
  
  private let descrip : [String] = [
    "If you think you can do 1 + 2",
    "Fans of Thor and Spiderman, c'mon through",
    "Periodic tables and whatnot, this is general stuff"
  ]
  
  private let questions : [[String]] = [["What's 1 / 2?", "What's 9 * 10?",
                                         "What is the square root of 4?"],
                                        ["What's Iron Man's real name?",
                                         "What's Thor's hammer called?"],
                                        ["What's has an atomic number of 12?",
                                         "What makes up a hypothesis?"]]
  
  private let answers : [[String]] = [["0.5", "0.2", "0.1", "0.65"],
                                      ["91", "92", "90", "95"],
                                      ["2", "-2", "plus or minus 2", "0"],
                                      ["Tony Stark", "James Bond", "Alvin Harris",
                                       "Stan Lee"],
                                      ["Mjolnir", "Excalibur", "Mallet", "Wanda"],
                                      ["Magnesium", "Manganese", "Iron", "Hydrogen"],
                                      ["What, why, when", "If, then, because",
                                       "How and who", "Well and I guess"]]
  
  private let realAns : [String] = ["0.5", "90", "plus or minus 2", "Tony Stark",
                                    "Mjolnir", "Magnesium", "If, then, because"]
  
  func getSubjects() -> [String] {
    return subjects
  }
  
  func getDescrip() -> [String] {
    return descrip
  }
  
  func getQs() -> [String: [String]] {
    var dict = [String: [String]]()
    for i in 0...getSubjects().count - 1 {
      dict[getSubjects()[i]] = questions[i]
    }
    return dict
  }
  
  func getAs() -> [String: [String]] {
    var dict = [String: [String]]()
    for i in 0...questions.count - 1 {
      for j in 0...questions[i].count - 1 {
        dict[questions[i][j]] = answers[j]
      }
    }
    return dict
  }
  
  func getRealAs() -> [String] {
    return realAns
  }
}
