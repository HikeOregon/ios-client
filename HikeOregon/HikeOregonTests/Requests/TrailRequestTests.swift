//
//  TrailRequestTests.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import XCTest
@testable import HikeOregon

class TrailRequestTests: XCTestCase, RequestTestable {
  typealias RequestType = TrailRequest
  var request: TrailRequest!
  var session = MockURLSession()
  
  override func setUp() {
    super.setUp()
    
    let session = HTTPClient(session: self.session)
    self.request = TrailRequest(session: session)
  }
  
  override func tearDown() {
    self.session.nextData = nil
    self.session.nextError = nil
    super.tearDown()
  }
  
  func test_MalformedJson_CallsbackWithParseError() {
    self.session.nextData = Data(base64Encoded: ResponseInjections.malformedJson)
    self.session.nextError = nil
    self.request.send {(response, error) in
      XCTAssertNil(response)
      XCTAssertNotNil(error)
      XCTAssert(false)
      
      XCTAssertEqual(error! as! ResponseError, ResponseError.failedToParse)
    }
  }
  
  func test_NoData_CallsbackWithDataError() {
    self.session.nextData = nil
    self.session.nextError = nil
    self.request.send {(response, error) in
      XCTAssertNil(response)
      XCTAssertNotNil(error)
      
      XCTAssertEqual(error! as! ResponseError, ResponseError.noDataRecieved)
    }
  }
}
