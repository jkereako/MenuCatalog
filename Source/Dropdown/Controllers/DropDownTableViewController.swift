//
//  DropDownTableViewController.swift
//  Menus
//
//  Created by Jeff Kereakoglow on 4/22/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class DropDownTableViewController: UITableViewController {
  private var presentationAnimator: DropDownMenuPresentationAnimator?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Remove "Back"
    navigationController!.navigationBar.topItem?.title = ""
    title = "asdf"
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)

    transitionCoordinator()?.animateAlongsideTransition(
      { [unowned self] (context: UIViewControllerTransitionCoordinatorContext) in
        let navBar = self.navigationController!.navigationBar

        navBar.tintColor = UIColor.whiteColor()
        navBar.barTintColor = UIColor.blackColor()
      },
      completion: nil
    )
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    guard let destination = segue.destinationViewController as? DropDownMenuTableViewController else
    {
      fatalError("Expected `DropDownMenuTableViewController`.")
    }

    destination.transitioningDelegate = self
  }
}

extension DropDownTableViewController: UIViewControllerTransitioningDelegate {
  func animationControllerForPresentedController(
    presented: UIViewController, presentingController presenting: UIViewController,
    sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

    presentationAnimator = DropDownMenuPresentationAnimator()

    return presentationAnimator
  }

  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

    guard let snapshot = presentationAnimator?.snapshot else {
      fatalError("Snapshot is nil")
    }

    return DropDownMenuDismissalAnimator(snapshot: snapshot)
  }
}
