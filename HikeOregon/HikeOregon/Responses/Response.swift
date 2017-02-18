//
//  Response.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

protocol Response {
  var error: APIError? { get }
  
  init(from json: [String: AnyObject])
  init?(from data: Data)
}

extension Response {
  init?(from data: Data) {
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
      // TODO: Do we always want the response returned as a dictionary or an array of dicts?
      self.init(from: json as! [String: AnyObject])
    }
    catch {
      return nil
    }
  }
}
