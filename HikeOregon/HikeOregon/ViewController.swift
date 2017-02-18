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
    // Do any additional setup after loading the view, typically from a nib.
    
    let trailRequest = TrailRequest(searchFor: "Lake")
    trailRequest.send {(response, error) in
      if let response = response {
        print(response.trails)
      }
      else {
        print("RESPONSE NOT PARSED")
      }
    }
    
    let idRequest = TrailIdRequest(forId: 1)
    idRequest.send {(response, error) in
      if let response = response {
        print(response.trails)
      }
      else {
        print("ID RESPONSE NOT PARSED")
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

