//
//  Parameter.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

public protocol Parameter : CustomStringConvertible {
  var key: String { get }
  var value: String { get }
}

protocol BooleanParameter : ExpressibleByBooleanLiteral, Parameter {
  var internalValue: Bool { get }
}

protocol StringParameter : ExpressibleByStringLiteral, Parameter {
  var internalValue: String { get }
}

protocol IntParameter : ExpressibleByIntegerLiteral, Parameter {
  var internalValue: Int { get }
}

protocol DoubleParameter : ExpressibleByFloatLiteral, Parameter {
  var internalValue: Double { get }
}

protocol ArrayParameter : ExpressibleByArrayLiteral, Parameter {
  var internalValue: [Self.Element] { get }
  
  init?(_ elements: [Self.Element]?)
}

extension Parameter {
  public var description: String {
    return self.value
  }
}

extension BooleanParameter {
  public var value: String {
    return String(self.internalValue)
  }
  
  public init?(_ value: BooleanLiteralType?) {
    if let value = value {
      self.init(booleanLiteral: value)
    }
    else {
      return nil
    }
  }
}

extension StringParameter {
  public var value: String {
    return self.internalValue
  }
  
  public init?(_ value: StringLiteralType?) {
    if let value = value {
      self.init(stringLiteral: value)
    }
    else {
      return nil
    }
  }
}

extension IntParameter {
  public var value: String {
    return String(self.internalValue)
  }
  
  public init?(_ value: IntegerLiteralType?) {
    if let value = value {
      self.init(integerLiteral: value)
    }
    else {
      return nil
    }
  }
}

extension DoubleParameter {
  public var value: String {
    return String(self.internalValue)
  }
  
  public init?(_ value: FloatLiteralType?) {
    if let value = value {
      self.init(floatLiteral: value)
    }
    else {
      return nil
    }
  }
}

extension ArrayParameter {
  public var value: String {
    return self.internalValue.map() { "\($0)" }.joined(separator: ",")
  }
  
  public init(arrayLiteral elements: Self.Element...) {
    self.init(elements)!
  }
}
