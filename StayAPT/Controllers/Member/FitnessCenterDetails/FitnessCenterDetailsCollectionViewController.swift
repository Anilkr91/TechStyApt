//
//  FitnessCenterDetailsTableViewController.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import YBSlantedCollectionViewLayout

class FitnessCenterDetailsCollectionViewController: BaseViewController {
    
     @IBOutlet weak var collectionView: UICollectionView!
    
    var array = ["Information", "Gallery" ,"Classes", "Facilities", "Timetable", "Trainers", "Membership"]
    
    var fcId : String?
    var gymName: String?
    
    var fitnessCenterDetail: FitnessCenterDetailResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        populateFitnessCenterDetails(id: fcId!)
        
       
    }
    
    // MARK: - Table view data source
    
    func setUpSegue(indexPath: Int) {
        switch indexPath {
        case 0: performSegue(withIdentifier: "showInformationSegue", sender: self)
        case 1: performSegue(withIdentifier: "showInformationSegue", sender: self)
        //        case 2: performSegue(withIdentifier: "showClassesSegue", sender: self)
        case 3: performSegue(withIdentifier: "showClassesSegue", sender: self)
        case 4: performSegue(withIdentifier: "showFacilitiesSegue", sender: self)
        case 5: performSegue(withIdentifier: "showTimeTableSegue", sender: self)
        case 6: performSegue(withIdentifier: "showTrainersSegue", sender: self)
        case 7: performSegue(withIdentifier: "showMembershipSegue", sender: self)
        default: print(indexPath)
        }
    }
    
    func populateFitnessCenterDetails(id: String) {
        
        let param = ["fcid" : id]
        FitnessCenterDetailsGetService.executeRequest(param as [String : AnyObject]) { (data) in
            print(data)
            self.fitnessCenterDetail = data
        }
    }
}

extension FitnessCenterDetailsCollectionViewController: UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FitnessCenterDetailCollectionCell
        
        cell.member = array[indexPath.item]
        return cell
    }
}

extension FitnessCenterDetailsCollectionViewController: UICollectionViewDelegate {
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        NSLog("Did select item at indexPath: [\(indexPath.section)][\(indexPath.row)]")
//        performSegue(withIdentifier: "showDietPlanSegue", sender: self)
        
        setUpSegue(indexPath: indexPath.item)
    }
}

extension FitnessCenterDetailsCollectionViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = self.collectionView else {return}
        guard let visibleCells = collectionView.visibleCells as? [FitnessCenterDetailCollectionViewCell] else {return}
        for parallaxCell in visibleCells {
            let yOffset = ((collectionView.contentOffset.y - parallaxCell.frame.origin.y) / parallaxCell.imageHeight) * yOffsetSpeed
            let xOffset = ((collectionView.contentOffset.x - parallaxCell.frame.origin.x) / parallaxCell.imageWidth) * xOffsetSpeed
            parallaxCell.offset(CGPoint(x: xOffset,y :yOffset))
        }
    }
    
    func setUpCollectionView() {
        let layout = collectionView?.collectionViewLayout as! YBSlantedCollectionViewLayout
        layout.reverseSlantingAngle = true
        layout.firstCellSlantingEnabled = false
        layout.lastCellSlantingEnabled = false
        layout.lineSpacing = 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showClassesSegue" {
            
            let dvc = segue.destination as! FitnessClassesCollectionViewController
            dvc.memberArray =  fitnessCenterDetail.classes
            
        } else if segue.identifier == "showFacilitiesSegue" {
            let dvc = segue.destination as! FitnessFacilitiesTableViewController
            dvc.memberArray =  fitnessCenterDetail.facilities
            
        }else if  segue.identifier == "showInformationSegue" {
            let dvc = segue.destination as! FitnessInformationTableViewController
            print(fitnessCenterDetail.information)
            
            dvc.information =  fitnessCenterDetail.information
            
        } else if  segue.identifier == "showTrainersSegue" {
            let dvc = segue.destination as! FitnessTrainersCollectionViewController
            dvc.memberArray =  fitnessCenterDetail.trainers
            
        } else if  segue.identifier == "showMembershipSegue" {
            let dvc = segue.destination as! FitnessMembershipTableViewController
            dvc.membership = fitnessCenterDetail.membership
        
        } else if segue.identifier == "showTimeTableSegue" {
           
            let dvc = segue.destination as! FitnessTimeTableTableViewController
            dvc.timeTable = fitnessCenterDetail.timeTableSunday
        }
    }
}
