//
//  GenericParameterTests.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/19/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import XCTest

class GenericParameterTests: XCTestCase {
  
  func test_Parameter_ValueReturnsStringifiedInternalValue() {
    let mockParam = MockParameter.x
    
    XCTAssertEqual(mockParam.value, "x")
  }
  
  func test_BoolParameter_ValueReturnsStringifiedInternalValue() {
    let mockBool = MockBooleanParameter(booleanLiteral: true)
    
    XCTAssertEqual(mockBool.value, "true")
  }
  
  func test_BoolParameter_ConvertsFromBooleanLiteral() {
    let mockBool: MockBooleanParameter = true
    
    XCTAssertEqual(mockBool.internalValue, true)
  }
  
  func test_StringParameter_ValueReturnsStringifiedInternalValue() {
    let mockString = MockStringParameter(stringLiteral: "Hello-World")
    
    XCTAssertEqual(mockString.value, "Hello-World")
  }
  
  func test_StringParameter_ConvertsFromStringLiteral() {
    let mockString: MockStringParameter = "Hello-World"
    
    XCTAssertEqual(mockString.internalValue, "Hello-World")
  }
  
  func test_IntParameter_ValueReturnsStringifiedInternalValue() {
    let mockInt = MockIntParameter(integerLiteral: 42)
    
    XCTAssertEqual(mockInt.value, "42")
  }
  
  func test_IntParameter_ConvertsFromIntLiteral() {
    let mockInt: MockIntParameter = 42
    
    XCTAssertEqual(mockInt.internalValue, 42)
  }
  
  func test_DoubleParameter_ValueReturnsStringifiedInternalValue() {
    let mockDouble = MockDoubleParameter(floatLiteral: 12.34)
    
    XCTAssertEqual(mockDouble.value, "12.34")
  }
  
  func test_DoubleParameter_ConvertsFromFloatLiteral() {
    let mockDouble: MockDoubleParameter = 12.34
    
    XCTAssertEqual(mockDouble.internalValue, 12.34)
  }
  
  func test_ArrayParameter_ValueReturnsStringifiedInternalValue() {
    let mockArray = MockArrayParameter([1, 2, 3, 4])
    
    XCTAssertEqual(mockArray.value, "1,2,3,4")
  }
  
  func test_ArrayParameter_ConvertsFromArrayLiteral() {
    let mockArray: MockArrayParameter = [1, 2, 3, 4]
    
    XCTAssertEqual(mockArray.internalValue, [1, 2, 3, 4])
  }
}
