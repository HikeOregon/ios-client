//
//  UIColor+HikeOregon.swift
//  HikeOregon
//
//  Created by Jason Custodio on 4/8/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
  
  static func forestGreen() -> UIColor {
    return rgb(red: 20, green: 53, blue: 26)
  }
  
}
