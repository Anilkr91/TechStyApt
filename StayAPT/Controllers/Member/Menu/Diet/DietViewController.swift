//
//  TestViewController.swift
//  StayAPT
//
//  Created by admin on 04/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import UIKit

import YBSlantedCollectionViewLayout

class DietViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "Cell"
    
    let dietArray = [ SACheckedInMember(image: "image-1", name: "Muscle Gain for Women", counter: "20/20"),
                      SACheckedInMember(image: "image-3", name: "Weight Loss for Men", counter: "20/20"),
                      SACheckedInMember(image: "image-2", name: "Muscle Gain for Men", counter: "20/20"),
                      SACheckedInMember(image: "image-3", name: "Weight Loss for Women", counter: "20/20")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
    
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
}

extension DietViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dietArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FitnessCenterDetailCollectionViewCell
        cell.member = dietArray[indexPath.row]
        
        return cell
    }
}

extension DietViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("Did select item at indexPath: [\(indexPath.section)][\(indexPath.row)]")
        
        performSegue(withIdentifier: "showDietPlanSegue", sender: self)
    }
}

extension DietViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = self.collectionView else {return}
        guard let visibleCells = collectionView.visibleCells as? [FitnessCenterDetailCollectionViewCell] else {return}
        for parallaxCell in visibleCells {
            let yOffset = ((collectionView.contentOffset.y - parallaxCell.frame.origin.y) / parallaxCell.imageHeight) * yOffsetSpeed
            let xOffset = ((collectionView.contentOffset.x - parallaxCell.frame.origin.x) / parallaxCell.imageWidth) * xOffsetSpeed
            parallaxCell.offset(CGPoint(x: xOffset,y :yOffset))
        }
    }
}
