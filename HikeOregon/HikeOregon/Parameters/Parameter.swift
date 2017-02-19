//
//  Parameter.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

/**
 A type that can be represented as a query parameter in an HTTP Request
 
 Types that conform to this protocol provide a key-value string pair to be represented as 
 "\<key\>=\<value\>" when used in the query string. Types conforming to this protocol are most often 
 useful as enum types, as each enum variant can be given a specific value to constrain what possible 
 values one could have. For more tight type constraints see the `Parameter` protocol derivations.
 */
protocol Parameter : CustomStringConvertible {
  /// The key of the query parameter
  var key: String { get }
  
  /// The value of the query parameter
  var value: String { get }
}

/**
 A boolean type that can be represented as a query parameter in an HTTP Request
 
 This protocol offers a tighter type constraint over the `Parameter` protocol, requiring that any 
 conforming type be expressly convertible from a boolean type. This means that it can only represent 
 true/false parameters.
 */
protocol BooleanParameter : ExpressibleByBooleanLiteral, Parameter {
  /// The backing representation of the query value
  var internalValue: Bool { get }
}

/**
 A string type that can be represented as a query parameter in an HTTP Request
 
 This protocol offers a type constraint over the `Parameter` protocol, requiring that any conforming 
 type be expressly convertible from a string type. This means that it can represent any parameter value 
 since all parameter values are converted to the `String` type before being used as part of the query 
 string.
 */
protocol StringParameter : ExpressibleByStringLiteral, Parameter {
  /// The backing representation of the query value
  var internalValue: String { get }
}

/**
 An integer type that can be represented as a query parameter in an HTTP Request
 
 This protocol offers a tighter type constraint over the `Parameter` protocol, requiring that any 
 conforming type be expressly convertible from an integer type. This means that it can only represent 
 integer values, though there are no constraints on the range of values it can represent.
 */
protocol IntParameter : ExpressibleByIntegerLiteral, Parameter {
  /// The backing representation of the query value
  var internalValue: Int { get }
}

/**
 A float type that can be represented as a query parameter in an HTTP Request
 
 This protocol offers a tighter type constraint over the `Parameter` protocol, requiring that any 
 conforming type be expressly convertible from a floating point type. This means that it can only 
 represent decimal values, though there are no constraints on the range of values it can represent.
 */
protocol DoubleParameter : ExpressibleByFloatLiteral, Parameter {
  /// The backing representation of the query value
  var internalValue: Double { get }
}

/**
 An array type that can be represented as a query parameter in an HTTP Request
 
 This protocol offers a tighter type constraint over the `Parameter` protocol, requiring that any 
 conforming type be expressly convertible from an array type. This means that it can only represent 
 collections of values, such as:
 ```
 <key>=<value1>,<value2>,<value3>
 ```
 */
protocol ArrayParameter : ExpressibleByArrayLiteral, Parameter {
  /// The backing representation of the query value
  var internalValue: [Self.Element] { get }
  
  init(_ elements: [Self.Element])
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
  
  public init(_ value: BooleanLiteralType) {
    self.init(booleanLiteral: value)
  }
}

extension StringParameter {
  public var value: String {
    return self.internalValue
  }
  
  public init(_ value: StringLiteralType) {
      self.init(stringLiteral: value)
  }
}

extension IntParameter {
  public var value: String {
    return String(self.internalValue)
  }
  
  public init(_ value: IntegerLiteralType) {
    self.init(integerLiteral: value)
  }
}

extension DoubleParameter {
  public var value: String {
    return String(self.internalValue)
  }
  
  public init(_ value: FloatLiteralType) {
    self.init(floatLiteral: value)
  }
}

extension ArrayParameter {
  public var value: String {
    return self.internalValue.map() { "\($0)" }.joined(separator: ",")
  }
  
  public init(arrayLiteral elements: Self.Element...) {
    self.init(elements)
  }
}
