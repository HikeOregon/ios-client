//
//  TrailRequest.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

let endpoint = "http://bobbyesh.pythonanywhere.com/api/trails/";

struct TrailRequest {
  let id: Int;
  
  init(forId id: Int) {
    self.id = id;
  }
}

extension TrailRequest: Request {
  typealias ResponseType = TrailResponse
  
  func generateURLRequest() -> URLRequest? {
    let urlString = endpoint//.appending("\(self.id)")
    guard let url = URL(string: urlString) else {
      return nil
    }
    return URLRequest(url: url)
  }
}
