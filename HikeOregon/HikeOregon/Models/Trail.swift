//
//  Trail.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation
import CoreLocation

enum Difficulty: Int {
  case unknown, one, two, three, four, five
  
  init(rawValue: Int) {
    switch rawValue {
    case 1: self = .one
    case 2: self = .two
    case 3: self = .three
    case 4: self = .four
    case 5: self = .five
    default: self = .unknown
    }
  }
}

struct Trail: Model {
  let id: Int
  let name: String
  let location: CLLocation
  let length: Double
  let difficulty: Difficulty
  let hasRestroom: Bool
  
  init?(from dict: [String: AnyObject]) {
    guard let id = dict["id"] as? Int else { return nil }
    guard let name = dict["name"] as? String else { return nil }
    guard let latitude = dict["latitude"] as? Double else { return nil }
    guard let longitude = dict["longitude"] as? Double else { return nil }
    guard let length = dict["length"] as? Double else { return nil }
    guard let difficulty = dict["difficulty"] as? Int else { return nil }
    guard let hasRestroom = dict["restroom"] as? Bool else { return nil }
    
    self.id = id
    self.name = name
    self.location = CLLocation(latitude: latitude, longitude: longitude)
    self.length = length
    self.difficulty = Difficulty(rawValue: difficulty)
    self.hasRestroom = hasRestroom
  }
}
