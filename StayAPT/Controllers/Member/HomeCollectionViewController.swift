//
//  HomeViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
//import SpinWheelControl

class HomeCollectionViewController: BaseCollectionViewController {

    let titleString: [String] = ["Notes","Goal of the Month","Ultimate Goal","Fitness Buddies","Fitness Center","My Workout","My Stats","Rate yourself"]
    
    var dialLayout:AWCollectionViewDialLayout!
    var cell_height:CGFloat!
    var type:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleCollectionView()
//        placeOffer()
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AWCollectionCell
        
        cell.icon.image = UIImage(named: "image-1")
        cell.label.text = titleString[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select Item :: ", indexPath.item)
        
        performSegue(withIdentifier: "showOptionsSegue", sender: self)
        //collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Top, animated: true)
    }
    
    func circleCollectionView() {
        
        let radius = CGFloat(0.39 * 1000)
        let angularSpacing = CGFloat(0.16 * 90)
        let xOffset = CGFloat(0.23 * 320)
        let cell_width = CGFloat(240)
        cell_height = 100
        dialLayout = AWCollectionViewDialLayout(raduis: radius, angularSpacing: angularSpacing, cellSize: CGSize(width: cell_width, height: cell_height) , alignment: WheelAlignmentType.center, itemHeight: cell_height, xOffset: xOffset)
//        dialLayout.shouldSnap = true
//        dialLayout.shouldFlip = true
        self.collectionView?.collectionViewLayout = dialLayout
        dialLayout.scrollDirection = .horizontal
        
       
        switchExample()
    }
    
    func switchExample(){
        
        var radius:CGFloat = 0 ,angularSpacing:CGFloat  = 0, xOffset:CGFloat = 0
        
        dialLayout.cellSize = CGSize(width: 340, height: 100)
        dialLayout.wheelType = .left
        dialLayout.shouldFlip = false
        
        radius = 300
        angularSpacing = 18
        xOffset = 70
        
        dialLayout.dialRadius = radius
        dialLayout.angularSpacing = angularSpacing
        dialLayout.xOffset = xOffset
        
        self.collectionView?.reloadData();
    }
}
