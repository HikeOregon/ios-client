//
//  HTTPClient.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

typealias DataTaskResult = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol URLSessionProtocol {
  func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
  func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
  func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
    return (self.dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask)
  }
  
  func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
    return (self.dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTask)
  }
}

protocol URLSessionDataTaskProtocol {
  func resume()
}
extension URLSessionDataTask: URLSessionDataTaskProtocol {}

public final class HTTPClient {
  static let sharedClient = HTTPClient()
  fileprivate let session: URLSessionProtocol
  
  /**
   Initialize a new HTTPClient with the session to use for network requests
   
   - Parameter session: The session object to use to make network requests
   */
  init(session: URLSessionProtocol = URLSession.shared) {
    self.session = session
  }
  
  /**
   Send a request to the specified url.
   
   - Parameter url: The url to request from
   - Parameter completionHandler: The handler to call with the response information
   */
  func send(_ url: URL, completionHandler handler: @escaping DataTaskResult) {
    let task = self.session.dataTask(with: url, completionHandler: handler)
    task.resume()
  }
  
  /**
   Send a request using the specified NSURLRequest object
   
   - Parameter request: The request object to request information with
   - Parameter completionHandler: The handler to call with the response information
   */
  func send(_ request: URLRequest, completionHandler handler: @escaping DataTaskResult) {
    let task = self.session.dataTask(with: request, completionHandler: handler)
    task.resume()
  }
}
