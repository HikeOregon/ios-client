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
  func test_ParseFromDictionary() {
    let _eagleCreek = Trail(from: TrailDictionaries.eagleCreek);
    XCTAssertNotNil(_eagleCreek);
    let eagleCreek = _eagleCreek!;
    
    XCTAssertEqual(eagleCreek.id, 2);
    XCTAssertEqual(eagleCreek.name, "Eagle Creek");
    XCTAssertEqual(eagleCreek.location.coordinate.latitude, 52.0);
    XCTAssertEqual(eagleCreek.location.coordinate.longitude, -23.0);
    XCTAssertEqual(eagleCreek.length, 15.9);
    XCTAssertEqual(eagleCreek.difficulty, .three)
    XCTAssertEqual(eagleCreek.hasRestroom, false);
  }
  
  func test_ParseFromInvalidDictionary_ReturnsNil() {
    let invalid = Trail(from: TrailDictionaries.invalidDict);
    XCTAssertNil(invalid);
  }
}
