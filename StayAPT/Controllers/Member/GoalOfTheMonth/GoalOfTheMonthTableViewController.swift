//
//  GoalOfTheMonthTableViewController.swift
//  StayAPT
//
//  Created by admin on 04/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class  GoalOfTheMonthTableViewController: BaseTableViewController {
    
    @IBOutlet weak var goalOfTheMonthImageView: UIImageView!
    @IBOutlet weak var goalOfTheMonthLabel: UILabel!
    
    @IBOutlet weak var ultimateGoalImageView: UIImageView!
    @IBOutlet weak var ultimateGoalLabel: UILabel!
    
    @IBOutlet weak var chestLabel: smallLabel!
    @IBOutlet weak var bicepsLabel: smallLabel!
    @IBOutlet weak var forearmLabel: smallLabel!
    @IBOutlet weak var wristLabel: smallLabel!
    
    @IBOutlet weak var shoulderLabel: smallLabel!
    @IBOutlet weak var WaistLabel: smallLabel!
    @IBOutlet weak var thighsLabel: smallLabel!
    @IBOutlet weak var calvesLabel: smallLabel!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    
    let array = ["Goal Of The Month", "Ultimate Goal", "Fitness Center", "My WorkOut", "My Stats", "Rate Yourself", "Note"]
    var goalOfTheMonth: GoalOfTheMonthModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchGoalOfTheMonth()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDailyWeightSegue", sender: self)
    }
    
    func fetchGoalOfTheMonth() {
        
//        let user = LoginUtils.getCurrentMemberUserLogin()
        
        let param = ["userId": "25"] as [String : AnyObject]
        GoalOfTheMonthGetService.executeRequest(param) { (data) in
            
            self.goalOfTheMonth = data
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        
        case 2:
            return 1
//            return goalOfTheMonth.favouriteFitnessCenter.count
        case 3:
            return 1
//            return goalOfTheMonth.workOut.count
        default:
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.section
        switch index {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell0", for: indexPath)
            return cell
       
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
            return cell
        
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
            return cell
        
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
            return cell
        
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath)
            return cell
        
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath)
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell6", for: indexPath)
            return cell
            
            <#code#>
        default:
            <#code#>
        }
        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return array[section]
    }
}


