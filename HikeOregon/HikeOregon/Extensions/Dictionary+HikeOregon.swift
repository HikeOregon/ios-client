//
//  Dictionary+HikeOregon.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: ExpressibleByStringLiteral {
  mutating func insertParameter(_ parameter: Parameter) {
    if let key = parameter.key as? Key, let value = parameter.value as? Value {
      self[key] = value
    }
  }
  
  func httpParameters() -> String {
    let parameterArray = self.map { (key, value) -> String in
      let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
      let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
      return "\(percentEscapedKey)=\(percentEscapedValue)"
    }
    
    return parameterArray.joined(separator: "&")
  }
}
