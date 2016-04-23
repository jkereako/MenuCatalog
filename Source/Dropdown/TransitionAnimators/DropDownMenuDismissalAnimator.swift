//
//  DropDownMenuDismissalAnimator.swift
//  Menus
//
//  Created by Jeff Kereakoglow on 4/22/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class DropDownMenuDismissalAnimator: NSObject {
  let snapshot: UIView

  init(snapshot: UIView) {
    self.snapshot = snapshot
    super.init()
  }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension DropDownMenuDismissalAnimator: UIViewControllerAnimatedTransitioning {
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)
    -> NSTimeInterval {

      return 0.5
  }

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    guard let from = transitionContext.viewForKey(UITransitionContextFromViewKey),
      let to = transitionContext.viewForKey(UITransitionContextToViewKey) else {
        fatalError("Found nil values.")
    }

    from.userInteractionEnabled = false
    to.userInteractionEnabled = true

    UIView.animateWithDuration(
      0.5,
      delay: 0.0,
      usingSpringWithDamping: 0.9,
      initialSpringVelocity: 0.3,
      options: .CurveEaseInOut,
      animations: { [unowned self] in
        self.snapshot.transform = CGAffineTransformIdentity
      },
      completion: { (done: Bool) in
        transitionContext.completeTransition(done)
        // REVIEW: Do I really need to do this?
        self.snapshot.removeFromSuperview()
      }
    )
  }
}
