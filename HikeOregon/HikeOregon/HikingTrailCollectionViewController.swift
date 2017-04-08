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

  let trailCellIdentifier = "trailCell"
  let cellHeight = CGFloat(150)
  let imageArray = [#imageLiteral(resourceName: "bridal veils_temp"), #imageLiteral(resourceName: "oneonta_temp"), #imageLiteral(resourceName: "latourell_temp")]
  var hikeArray = [Trail]()
  
  
  //******* SETUP *******//
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateTrails()

    
    collectionView?.alwaysBounceVertical = true
    navigationItem.title = "HIKING TRAILS"
    collectionView?.backgroundColor = UIColor.forestGreen()
    
    // Create custom cell for collectionView
    collectionView?.register(TrailCell.self, forCellWithReuseIdentifier: trailCellIdentifier)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.collectionView?.reloadData()
  }
  
  func updateTrails() {
    
    let trailRequest = TrailRequest(page: nil, searchFor: nil, difficulty: nil, hasRestroom: nil, length: nil)
    trailRequest.send {(response, error) in
      if let response = response {
        self.hikeArray = response.trails
        self.collectionView?.reloadData()
      }
      else {
        print("RESPONSE NOT PARSED")
      }
    }
    
     /*
     DispatchQueue.main.async (execute: { () -> Void in
     if(self.hikeArray.count > 0) {
     self.collectionView?.reloadData()
     }
     })
     */ //Spinner
  }
  
  
  
  
  //******* SETTING UP COLLECTION VIEW *******//
  
  // Create number of hikes per section
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.hikeArray.count // Test purposes
  }
  
  // Create trail cells
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
    let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: trailCellIdentifier, for: indexPath)
    let trailCell = dequeued as! TrailCell
    
    trailCell.trail = hikeArray[indexPath.item]
    
    // Change when images are on server
    trailCell.hikeButton.setBackgroundImage(imageArray[indexPath.row], for: .normal)
    
    
    return trailCell
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








