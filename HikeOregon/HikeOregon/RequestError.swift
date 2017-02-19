//
//  RequestError.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

enum RequestError: APIError {
  case failedToGenerate
  case failedToSend(err: NSError)
}

extension RequestError: Equatable {
  static func ==(lhs: RequestError, rhs: RequestError) -> Bool {
    switch (lhs, rhs) {
    case (.failedToGenerate, .failedToGenerate): return true
    case (.failedToSend(_), .failedToSend(_)): return true
    default: return false
    }
  }
}
