//
//  TrailRequest.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

struct TrailRequest: Request {
  typealias ResponseType = TrailResponse

  let parameters: [String : String]
  let endpoint: String
  let session: HTTPClient
  
  init(searchFor search: TrailSearchParameter? = nil, session: HTTPClient = HTTPClient.sharedClient) {
    var parameters = [String: String]()
    if let search = search {
      parameters.insertParameter(search)
    }
    
    self.parameters = parameters
    self.endpoint = Endpoint.trails
    self.session = session
  }
}

struct TrailIdRequest: Request {
  typealias ResponseType = TrailResponse
  
  let id: Int
  let parameters: [String : String]
  let endpoint: String
  let session: HTTPClient
  
  init(forId id: Int, session: HTTPClient = HTTPClient.sharedClient) {
    self.id = id
    self.parameters = [String: String]()
    self.endpoint = "\(Endpoint.trails)\(self.id)"
    self.session = session
  }
}
