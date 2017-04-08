//
//  TrailCell.swift
//  HikeOregon
//
//  Created by Jason Custodio on 4/8/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import UIKit

class TrailCell: UICollectionViewCell {
  
  var trail: Trail? {
    didSet {
      if let trailName = trail?.name {
        hikeButton.setTitle(trailName, for: .normal)
        hikeButton.setTitleColor(.white, for: .normal)
      }
    }
  }
  
  
  // Called when cell is dequequed
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  func setupView() {
    backgroundColor = UIColor.black
    
       addSubview(hikeButton)
    
    addFormatConstraint("H:|[v0]|", views: hikeButton)
    addFormatConstraint("V:|[v0]|", views: hikeButton)
  }
  
  let hikeButton: UIButton = {
    let button = UIButton()
    

    return button
  }()
  
  
  
  // Swift specific error
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
