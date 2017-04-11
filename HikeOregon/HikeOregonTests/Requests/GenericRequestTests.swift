//
//  GenericRequestTests.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import XCTest
@testable import HikeOregon

class GenericRequestTests: XCTestCase, RequestTestable {
  typealias RequestType = MockRequest
  
  var request: MockRequest!
  var session = MockURLSession()
  
  override func setUp() {
    super.setUp()
    
    self.request = MockRequest(session: self.session)
  }
  
  override func tearDown() {
    self.session.nextData = nil
    self.session.nextError = nil
    super.tearDown()
  }
  
  func test_MalformedJson_CallsbackWithParseError() {
    let expect = expectation(description: "handler called")
    self.session.nextData = Data(base64Encoded: ResponseInjections.malformedJson)
    self.request.send {(result) in
      XCTAssert(result.isErr())
      XCTAssertEqual(result.intoErr()! as! ResponseError, .failedToParse)
      expect.fulfill()
    }
    
    waitForExpectations(timeout: 1.0)
  }
  
  func test_NoData_CallsbackWithDataError() {
    let expect = expectation(description: "handler called")
    self.request.send {(result) in
      XCTAssert(result.isErr())
      XCTAssertEqual(result.intoErr()! as! ResponseError, .noDataRecieved)
      expect.fulfill()
    }
    
    waitForExpectations(timeout: 1.0)
  }
  
  func test_MalformedURL_CallsbackWithRequestError() {
    let expect = expectation(description: "handler called")
    self.request = MockRequest(endpoint: "<~>", session: self.session)
    self.request.send {(result) in
      XCTAssert(result.isErr())
      XCTAssertEqual(result.intoErr()! as! RequestError, .failedToGenerate)
      expect.fulfill()
    }
    
    waitForExpectations(timeout: 1.0)
  }
  
  func test_SendingErrors_CallsbackWithRequestError() {
    let expect = expectation(description: "handler called")
    let mockError = NSError(domain: "mock", code: 0, userInfo: nil)
    self.session.nextError = mockError
    self.request.send {(result) in
      XCTAssert(result.isErr())
      XCTAssertEqual(result.intoErr()! as! RequestError, .failedToSend(err: mockError))
      expect.fulfill()
    }
    
    waitForExpectations(timeout: 1.0)
  }
}
