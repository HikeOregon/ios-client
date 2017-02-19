//
//  ParameterMockObjects.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/19/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation
@testable import HikeOregon

enum MockParameter: String, Parameter {
  var key: String {
    return "mock_param"
  }
  
  var value: String {
    return String(self.rawValue)
  }
  
  case x = "x"
  case y = "y"
  case z = "z"
}

struct MockBooleanParameter: BooleanParameter {
  let key = "mock_bool"
  let internalValue: Bool
  
  init(booleanLiteral value: BooleanLiteralType) {
    self.internalValue = value
  }
}

struct MockStringParameter: StringParameter {
  typealias UnicodeScalarLiteralType = Character
  typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
  
  let key = "mock_string"
  let internalValue: String
  
  init(stringLiteral value: StringLiteralType) {
    self.internalValue = value
  }
  
  init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
    self.internalValue = "\(value)"
  }
  
  init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
    self.internalValue = value
  }
}

struct MockIntParameter: IntParameter {
  let key = "mock_int"
  let internalValue: Int
  
  init(integerLiteral value: IntegerLiteralType) {
    self.internalValue = value
  }
}

struct MockDoubleParameter: DoubleParameter {
  let key = "mock_double"
  let internalValue: Double
  
  init(floatLiteral value: FloatLiteralType) {
    self.internalValue = value
  }
}

struct MockArrayParameter: ArrayParameter {
  typealias Element = Int
  let key = "mock_array"
  let internalValue: [Element]
  
  init(_ elements: [Element]) {
    self.internalValue = elements
  }
}
