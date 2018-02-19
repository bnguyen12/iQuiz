//
//  CustomTableViewCell.swift
//  iQuiz
//
//  Created by Benny Nguyen on 2/10/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  

  @IBOutlet weak var myImage: UIImageView!
  @IBOutlet weak var myLbl: UILabel!
  @IBOutlet weak var myDescrip: UILabel!
  @IBOutlet weak var answerLabel: UILabel!
  override func awakeFromNib() {
      super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
  }

}
