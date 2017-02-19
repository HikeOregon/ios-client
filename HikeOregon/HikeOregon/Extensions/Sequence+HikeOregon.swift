//
//  Array+HikeOregon.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/19/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element == Parameter {
  func httpParameters() -> String {
    let parameterArray = self.map { (parameter) -> String in
      let percentEscapedKey = parameter.key.addingPercentEncodingForURLQueryValue()!
      let percentEscapedValue = parameter.value.addingPercentEncodingForURLQueryValue()!
      return "\(percentEscapedKey)=\(percentEscapedValue)"
    }
    
    return parameterArray.joined(separator: "&")
  }
}

extension RangeReplaceableCollection where Iterator.Element == Parameter {
  mutating func insertParameter(_ parameter: Parameter?) {
    guard let parameter = parameter else { return }
    self.append(parameter)
  }
}
