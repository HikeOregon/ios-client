//
//  Model.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

protocol Model {
  init?(from dict: [String: AnyObject])
}
