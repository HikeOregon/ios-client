//
//  RequestTestHelper.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation
import XCTest
@testable import HikeOregon

protocol RequestTestable {
  associatedtype RequestType: Request
  
  var request: RequestType! { get }
  var session: MockURLSession { get }
}

extension RequestTestable where Self: XCTestCase {
}
