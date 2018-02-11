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
  
  func getSubjects() -> [String] {
    return subjects
  }
  
  func getDescrip() -> [String] {
    return descrip
  }
}
