//
//  MainMenuTableViewController.swift
//  MenuCatalog
//
//  Created by Jeff Kereakoglow on 4/22/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {
  private var navBarBackgroundColor: UIColor!
  private var navBarTintColor: UIColor!

  override func viewDidLoad() {
    super.viewDidLoad()

    navBarBackgroundColor = navigationController?.navigationBar.barTintColor
    navBarTintColor = navigationController?.navigationBar.tintColor
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)

    transitionCoordinator()?.animateAlongsideTransition(
      { [unowned self] (context: UIViewControllerTransitionCoordinatorContext) in
        let navBar = self.navigationController!.navigationBar

        navBar.tintColor = self.navBarTintColor
        navBar.barTintColor = self.navBarBackgroundColor
        navBar.topItem?.title = ""
      },
      completion: nil
    )
  }
}