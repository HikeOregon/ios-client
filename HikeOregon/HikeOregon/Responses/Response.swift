//
//  Response.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

/**
 A type that can be parsed from a JSON body
 
 Types that conform to this protocol can be parsed from a JSON dictionary with the `init(from: [String: 
 AnyObject])` initializer. The `init?(from: Data)` initializer is provided as a helper to automatically 
 try and convert a `Data` object into a JSON dictionary.
 */
protocol Response {
  /// The error that has occurred or nil if there was no error
  var error: APIError? { get }
  
  /**
   Initialize the response from a JSON dictionary
   
   -Parameter json: The JSON dictionary to parse the response from
   */
  init(from json: [String: AnyObject])
}

extension Response {
  /**
   Initialize the response from a `Data` object
   
   This helper initializer attempts to serialize the data into a JSON object and call the `init(from: 
   [String: AnyObject])` initializer. If the serialization fails, the initializer will return nil.
   
   -Parameter data: The data object to parse the response from
   */
  init?(from data: Data) {
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
      self.init(from: json as! [String: AnyObject])
    }
    catch {
      return nil
    }
  }
}
