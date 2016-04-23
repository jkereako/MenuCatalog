//
//  DropDownMenuPresentationAnimator.swift
//  Menus
//
//  Created by Jeff Kereakoglow on 4/22/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class DropDownMenuPresentationAnimator: NSObject {
  private let duration: NSTimeInterval
  var snapshot: UIView?

  init(duration: NSTimeInterval) {
    self.duration = duration
    super.init()
  }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension DropDownMenuPresentationAnimator: UIViewControllerAnimatedTransitioning {
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)
    -> NSTimeInterval {

      return self.duration
  }

  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    guard let container = transitionContext.containerView(),
      let from = transitionContext.viewForKey(UITransitionContextFromViewKey),
      let to = transitionContext.viewForKey(UITransitionContextToViewKey) else {
        assertionFailure("Found nil values.")
        return
    }

    snapshot = from.snapshotViewAfterScreenUpdates(true)

    container.addSubview(to)
    container.addSubview(snapshot!)
    
    from.userInteractionEnabled = false
    to.userInteractionEnabled = true

    UIView.animateWithDuration(
      self.duration,
      delay: 0.0,
      usingSpringWithDamping: 0.9,
      initialSpringVelocity: 0.3,
      options: .CurveEaseInOut,
      animations: { [unowned self] in
        self.snapshot!.transform = CGAffineTransformMakeTranslation(0, container.frame.height - 150)
        to.transform = CGAffineTransformIdentity
      },
      completion: { (done: Bool) in
        transitionContext.completeTransition(done)
      }
    )
  }
}
