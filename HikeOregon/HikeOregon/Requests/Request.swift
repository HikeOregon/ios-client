//
//  Request.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

typealias RequestResult<T: Response> = Result<T, APIError>

/**
 A type that can execute an HTTP request
 
 Conforming types can be used to send an HTTP request to a specified endpoint with some given 
 parameters. Configuration of the request is done through the `endpoint` and `parameters` properties. 
 The `send` method can be called to actually executed the request. When the request completes, a 
 callback will be exectued with either the parsed response object, or an error if one occurred.
 
 The `ResponseType` associated type is the type of object that we are expecting as a response from the 
 HTTP request. When the callback fires after `send` completes, the response returned will be of this 
 type.
 */
protocol Request {
  /// The type of the responce object we are expecting back
  associatedtype ResponseType: Response;
  
  /// The full string url path we are sending the request to (including domain name and route)
  var endpoint: String { get }
  
  /// The query parameters that should be sent as a part of the request
  var parameters: [Parameter] { get }
  
  /// The session used to send the request, this is mainly for mocking purposes
  var session: HTTPClient { get }

  func send(completionHandler handler: @escaping (_ result: RequestResult<Self.ResponseType>) -> Void);
}

extension Request {
  /**
   Send the request asynchronously
   
   When the response has been recieved, if no error has occurred, the body of the response will be 
   parsed and a `ResponseType` object will be instantiated. The `handler` callback will be exectued with 
   the parsed response, or an error if an error has occured.
   
   The callback will be executed on the main thread so that any updates to the UI within the completion 
   handler will be reflected immediately. This means you should be careful not to do intensive 
   calculations from within the callback.
   
   - Parameter completionHandler: The block to be executed upon completion of the request
   - Parameter response: The parsed response or nil if an error has occurred
   - Parameter error: An error if one has occurred either in parsing or in sending the request, 
      otherwise nil
   */
  func send(completionHandler handler: @escaping (_ result: RequestResult<Self.ResponseType>) -> Void) {
    guard let urlRequest = self.generateURLRequest() else {
      handler(.err(RequestError.failedToGenerate))
      return
    }
    
    self.session.send(urlRequest) {(data, response, error) in
      let result: RequestResult<Self.ResponseType>
      defer {
        DispatchQueue.main.async {
          handler(result)
        }
      }
      
      if let err = error {
        result = .err(RequestError.failedToSend(err: err as NSError))
        return
      }
      
      guard let jsonData = data else {
        result = .err(ResponseError.noDataRecieved)
        return
      }
      
      guard let response = Self.ResponseType(from: jsonData) else {
        result = .err(ResponseError.failedToParse)
        return
      }
      
      result = .ok(response)
    }
  }
  
  private func generateURLRequest() -> URLRequest? {
    let parameterString = self.parameters.httpParameters()
    guard let url = URL(string: "\(self.endpoint)?\(parameterString)") else {
      return nil
    }
    return URLRequest(url: url)
  }
}
