//
//  TrailModelDictionaries.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

enum TrailDictionaries {
  static let multinomahFalls: [String: AnyObject] = [
    "id": 1 as AnyObject,
    "name": "Multinomah Falls" as AnyObject,
    "latitude": 20.0 as AnyObject,
    "longitude": 20.0 as AnyObject,
    "length": 5.2 as AnyObject,
    "difficulty": 1 as AnyObject,
    "restroom": true as AnyObject
  ];

  static let eagleCreek: [String: AnyObject] = [
    "id": 2 as AnyObject,
    "name": "Eagle Creek" as AnyObject,
    "latitude": 52.0 as AnyObject,
    "longitude": -23.0 as AnyObject,
    "length": 15.9 as AnyObject,
    "difficulty": 3 as AnyObject,
    "restroom": false as AnyObject
  ];

  static let invalidDict: [String: AnyObject] = [String: AnyObject]();
}
