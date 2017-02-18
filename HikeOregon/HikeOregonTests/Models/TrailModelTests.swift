//
//  TrailModelTests.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import XCTest
@testable import HikeOregon

class TrailModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  
  
  func test_ParseFromDictionary() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    let _eagleCreek = Trail(fromDict: TrailDictionaries.eagleCreek);
    XCTAssertNotNil(_eagleCreek);
    let eagleCreek = _eagleCreek!;
    
    XCTAssertEqual(eagleCreek.id, 2);
    XCTAssertEqual(eagleCreek.name, "Eagle Creek");
    XCTAssertEqual(eagleCreek.location.coordinate.latitude, 52.0);
    XCTAssertEqual(eagleCreek.location.coordinate.longitude, -23.0);
    XCTAssertEqual(eagleCreek.length, 15.9);
    XCTAssertEqual(eagleCreek.difficulty, .Three);
    XCTAssertEqual(eagleCreek.hasRestroom, false);
  }
  
  func test_ParseFromInvalidDictionary_ReturnsNil() {
    let invalid = Trail(fromDict: TrailDictionaries.invalidDict);
    XCTAssertNil(invalid);
  }
}
