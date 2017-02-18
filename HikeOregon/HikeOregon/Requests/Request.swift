//
//  Request.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

protocol Request {
  associatedtype ResponseType: Response;
  
  var endpoint: String { get }
  var parameters: [String: String] { get }
  var session: HTTPClient { get }
  
  func send(completionHandler handler: @escaping (_ response: Self.ResponseType?, _ error: APIError?) -> Void);
}

extension Request {
  func send(completionHandler handler: @escaping (_ response: Self.ResponseType?, _ error: APIError?) -> Void) {
    guard let urlRequest = self.generateURLRequest() else {
      handler(nil, RequestError.failedToGenerate)
      return
    }
    
    self.session.send(urlRequest) {(data, response, error) in
      let finalResponse: Self.ResponseType?
      let finalError: APIError?
      defer {
        DispatchQueue.main.async {
          handler(finalResponse, finalError)
        }
      }
      
      if let err = error {
        finalResponse = nil
        finalError = RequestError.failedToSend(err: err as NSError)
        return
      }
      
      guard let jsonData = data else {
        finalResponse = nil
        finalError = ResponseError.noDataRecieved
        return
      }
      
      guard let response = Self.ResponseType(from: jsonData) else {
        finalResponse = nil
        finalError = ResponseError.failedToParse
        return
      }
      
      finalResponse = response;
      finalError = response.error;
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
