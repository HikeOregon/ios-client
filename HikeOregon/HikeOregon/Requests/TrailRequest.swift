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
  
  init(page: TrailPageParameter? = nil,
       searchFor search: TrailSearchParameter? = nil,
       difficulty: TrailDifficultyParameter? = nil,
       hasRestroom restroom: TrailRestroomParameter? = nil,
       // Min length? Max?
       length: TrailLengthParameter? = nil,
       session: HTTPClient = HTTPClient.sharedClient) {
    var parameters = [String: String]()
    parameters.insertParameter(page)
    parameters.insertParameter(search)
    parameters.insertParameter(difficulty)
    parameters.insertParameter(restroom)
    parameters.insertParameter(length)
    
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
