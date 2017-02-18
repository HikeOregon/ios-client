//
//  TrailRequest.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

let endpoint = "http://bobbyesh.pythonanywhere.com/api/trails/";

struct TrailRequest: Request {
  typealias ResponseType = TrailResponse

  let parameters: [String : String]
  let endpoint: String
  
  init(searchFor search: TrailSearchParameter? = nil) {
    var parameters = [String: String]()
    if let search = search {
      parameters.insertParameter(search)
    }
    
    self.parameters = parameters
    self.endpoint = "http://bobbyesh.pythonanywhere.com/api/trails/"
  }
}

struct TrailIdRequest: Request {
  typealias ResponseType = TrailResponse
  
  let id: Int
  let parameters: [String : String]
  let endpoint: String
  
  init(forId id: Int) {
    self.id = id
    self.parameters = [String: String]()
    self.endpoint = "http://bobbyesh.pythonanywhere.com/api/trails/\(self.id)"
  }
}
