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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return appdata.getSubjects().count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
    cell.myImage.image = UIImage(named: appdata.getSubjects()[indexPath.row])
    cell.myLbl.text = appdata.getSubjects()[indexPath.row]
    cell.myDescrip.text = appdata.getDescrip()[indexPath.row]
    return cell
  }
/*
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
*/
  
}

