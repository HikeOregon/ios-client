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
}
