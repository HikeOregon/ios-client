//
//  GenericResponseTests.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import XCTest
@testable import HikeOregon

class GenericResponseTests: XCTestCase, ResponseTestable {
  typealias ResponseType = MockResponse
  
  func test_MalformedData_ResponseFailsToParse() {
    let data = Data(base64Encoded: ResponseInjections.malformedJson)!
    
    let response = MockResponse(from: data)
    
    XCTAssertNil(response)
  }
  
  func test_ValidJson_ResponseParses() {
    let data = Data(base64Encoded: ResponseInjections.validJson)!
    
    let response = MockResponse(from: data)
    
    XCTAssertNotNil(response)
  }
}
