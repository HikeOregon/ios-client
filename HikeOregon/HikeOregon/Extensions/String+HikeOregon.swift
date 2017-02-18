//
//  String+HikeOregon.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import Foundation

extension String {
  func addingPercentEncodingForURLQueryValue() -> String? {
    let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
    
    return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
  }
}
