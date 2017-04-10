//
//  ViewController.swift
//  HikeOregon
//
//  Created by Daniel Seitz on 2/18/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let trailRequest = TrailRequest(page: nil, searchFor: nil, difficulty: nil, hasRestroom: nil, length: nil)
    trailRequest.send {(result) in
      print("--------------------")
      switch result {
      case .ok(let response):
        print(response.trails)
      case .err(let error):
        print("RESPONSE NOT PARSED: \(error)")
      }
    }
    
    let idRequest = TrailIdRequest(forId: 1)
    idRequest.send {(result) in
      print("--------------------")
      switch result {
      case .ok(let response):
        print(response.trails)
      case .err(let error):
        print("ID RESPONSE NOT PARSED: \(error)")
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

