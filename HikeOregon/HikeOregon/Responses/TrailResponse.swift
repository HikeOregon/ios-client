//
//  TrailResponse.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

struct TrailResponse: Response {
  let trails: [Trail]
  let error: APIError?
  
  init(from json: [String: AnyObject]) {
    let trailsJson = json["trails"] as! [[String: AnyObject]]
    var trails = [Trail]()
    for trail in trailsJson {
      let newTrail = Trail(from: trail)
      if let newTrail = newTrail {
        trails.append(newTrail)
      }
    }
    
    self.trails = trails
    self.error = nil
  }
}
