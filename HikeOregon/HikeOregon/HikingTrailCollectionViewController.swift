//
//  HikingTrailCollectionViewController.swift
//  HikeOregon
//
//  Created by Jason Custodio on 4/2/17.
//  Copyright © 2017 hikeoregon. All rights reserved.
//

import UIKit

class HikingTrailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  //******* VARIABLES *******//

  let customCellIdentifier = "customCellIdentifier"   // Custom Cell identifier
  let cellHeight = CGFloat(150)
  let numberOfTrails = 5
  
  
  //******* SETUP *******//
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.alwaysBounceVertical = true
    navigationItem.title = "HIKING TRAILS"
    collectionView?.backgroundColor = UIColor.forestGreen()
    
    // Create custom cell for collectionView
    collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customCellIdentifier)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  
  //******* SETTING UP COLLECTION VIEW *******//
  
  // Create number of hikes per section
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numberOfTrails // Test purposes
  }
  
  // Create hike cells
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath)
    
    return customCell
  }
  
  // Resize hike cells
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: cellHeight)
  }
  
  
  
  
  //********* EXTRA ***********//
  
  // Used for search bar to close keyboard
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
}




class CustomCell: UICollectionViewCell {
  
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
    button.setTitle("Multnomah Falls", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
 
  
  // Swift specific error
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension UIColor {
  
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
  
  static func forestGreen() -> UIColor {
    return rgb(red: 20, green: 53, blue: 26)
  }
  
}

extension UIView {
  
  func addFormatConstraint(_ format: String, views: UIView...) {
    
    var dict = [String:UIView]()
    
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      dict[key] = view
      
      // Turn off autoresizing to use custom constraints
      view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dict))
  }
  
}

