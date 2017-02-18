//
//  NetworkMockObjects.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation
@testable import HikeOregon

class MockURLSession: URLSessionProtocol {
  var nextData: Data?
  var nextError: NSError?
  var nextDataTask = MockURLSessionDataTask()
  fileprivate(set) var lastURL: URL?
  
  func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
    self.lastURL = url
    completionHandler(self.nextData, nil, self.nextError)
    return self.nextDataTask
  }
  
  func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
    self.lastURL = request.url
    completionHandler(self.nextData, nil, self.nextError)
    return self.nextDataTask
  }
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
  fileprivate(set) var resumeWasCalled = false
  
  func resume() {
    resumeWasCalled = true
  }
}
