//
//  Icon.swift
//  Menus
//
//  Created by Jeff Kereakoglow on 4/22/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

enum Icon: String {
  case ArrowDown

  func image(selected selected: Bool = false) -> UIImage {
    return UIImage(named: selected ? self.rawValue + "-selected" : self.rawValue)!
  }
}