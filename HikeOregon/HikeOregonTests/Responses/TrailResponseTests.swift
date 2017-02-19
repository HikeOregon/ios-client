//
//  TrailResponseTests.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import XCTest
@testable import HikeOregon

class TrailResponseTests: XCTestCase, ResponseTestable {
  typealias ResponseType = TrailResponse
  
  func test_ValidData_ResponseParsesSuccessfully() {
    let data = Data(base64Encoded: ResponseInjections.threeValidTrails)!
    
    let response = TrailResponse(from: data)
    
    XCTAssertNotNil(response)
    XCTAssertEqual(response!.trails.count, 3)
  }
}
