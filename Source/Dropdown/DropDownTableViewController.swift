//
//  DropDownTableViewController.swift
//  Menus
//
//  Created by Jeff Kereakoglow on 4/22/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class DropDownTableViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: Icon.ArrowDown.image(),
      style: .Plain,
      target: self,
      action: #selector(menuAction)
    )
  }

  @IBAction func menuAction(sender: UIBarButtonItem) {

  }
}