//
//  TrailRequestParameters.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

struct TrailSearchParameter: StringParameter {
  let key = "search"
  let internalValue: String
}

extension TrailSearchParameter : ExpressibleByStringLiteral {
  public typealias UnicodeScalarLiteralType = Character
  public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
  
  public init(stringLiteral value: StringLiteralType) {
    self.internalValue = value
  }
  
  public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
    self.internalValue = "\(value)"
  }
  
  public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
    self.internalValue = value
  }
}

struct TrailPageParameter: IntParameter {
  let key = "page"
  let internalValue: Int
  
  init(integerLiteral value: IntegerLiteralType) {
    self.internalValue = value
  }
}

struct TrailDifficultyParameter: IntParameter {
  let key = "difficulty"
  let internalValue: Int
  
  init(integerLiteral value: IntegerLiteralType) {
    self.internalValue = value
  }
}

struct TrailRestroomParameter: BooleanParameter {
  let key = "restroom"
  let internalValue: Bool
  
  init(booleanLiteral value: BooleanLiteralType) {
    self.internalValue = value
  }
}

struct TrailLengthParameter: DoubleParameter {
  let key = "length"
  let internalValue: Double
  
  init(floatLiteral value: FloatLiteralType) {
    self.internalValue = value
  }
}
