//
//  FitnessCenterDetailsTableViewController.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessCenterDetailsTableViewController: BaseTableViewController {
    
    let array = ["Gym Name", "Information", "Gallery" ,"Classes", "Facilities", "Timetable", "Trainers", "Membership"]
    
    var fcId : String?
    var fitnessCenterDetail: FitnessCenterDetailResponse!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(fcId)
        populateFitnessCenterDetails(id: fcId!)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return array.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.section % 2 == 0 {
           cell.backgroundColor  =  UIColor.red
        } else {
            cell.backgroundColor  = UIColor.white
        }
        cell.textLabel?.text = array[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setUpSegue(indexPath: indexPath.section)
    }
    
    func setUpSegue(indexPath: Int) {
        switch indexPath {
//        case 0: performSegue(withIdentifier: "showInformationSegue", sender: self)
        case 1: performSegue(withIdentifier: "showInformationSegue", sender: self)
//        case 2: performSegue(withIdentifier: "showClassesSegue", sender: self)
        case 3: performSegue(withIdentifier: "showClassesSegue", sender: self)
        case 4: performSegue(withIdentifier: "showFacilitiesSegue", sender: self)
       // case 5: performSegue(withIdentifier: "", sender: self)
        default: print(indexPath)
        }
    }
    
    func populateFitnessCenterDetails(id: String) {
        
        let param = ["fcid" : id]
        FitnessCenterDetailsGetService.executeRequest(param as [String : AnyObject]) { (data) in
            
            self.fitnessCenterDetail = data
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showClassesSegue" {
          
            let dvc = segue.destination as! FitnessClassesCollectionViewController
            print(fitnessCenterDetail)
            dvc.memberArray =  fitnessCenterDetail.classes
        }
    }
    
}
