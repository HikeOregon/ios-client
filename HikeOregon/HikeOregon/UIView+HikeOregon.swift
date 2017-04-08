//
//  UIView+HikeOregon.swift
//  HikeOregon
//
//  Created by Jason Custodio on 4/8/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  func addFormatConstraint(_ format: String, views: UIView...) {
    
    var dict = [String:UIView]()
    
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      dict[key] = view
      
      // Turn off autoresizing to use custom constraints
      view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dict))
  }
  
}
