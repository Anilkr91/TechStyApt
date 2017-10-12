//
//  GoalOfTheMonthTableViewController.swift
//  StayAPT
//
//  Created by admin on 04/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class  GoalOfTheMonthTableViewController: BaseTableViewController {

    let array = ["Goal Of The Month", "Ultimate Goal", "Fitness Center", "My WorkOut", "My Stats", "Rate Yourself", "Note"]
    var goalOfTheMonth: GoalOfTheMonthModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchGoalOfTheMonth()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDailyWeightSegue", sender: self)
    }
    
    func fetchGoalOfTheMonth() {
        
//        let user = LoginUtils.getCurrentMemberUserLogin()
        
        let param = ["userId": "22"] as [String : AnyObject]
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
            guard let count = goalOfTheMonth?.favouriteFitnessCenter.count else { return 1 }
//             return goalOfTheMonth!.favouriteFitnessCenter.count
            return count
           
        case 3:
            guard let count = goalOfTheMonth?.workOut.count else { return 1 }
            //             return goalOfTheMonth!.favouriteFitnessCenter.count
            return count
////            return goalOfTheMonth!.workOut.count 
//            return 1
            
        default:
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.section
        switch index {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell0", for: indexPath) as! GoalOfTheMonthCell
            
            cell.info = goalOfTheMonth?.goalMonth
            cell.goalOfTheMonthImageView.image = UIImage(named: "GGym")
            return cell
       
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! UltimateGoalOfTheMonth
            cell.ultimateGoalImageView.image = UIImage(named: "GGym")
            cell.ultimateGoalLabel.text = goalOfTheMonth?.ultimateGoal
            return cell
        
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! GoalOfTheMonthFavouriteFitnessCell
            cell.info = goalOfTheMonth?.favouriteFitnessCenter[indexPath.row]
            return cell
        
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! GoalOfTheMonthMyWorkOutCell
            cell.info = goalOfTheMonth?.workOut[indexPath.row]
            return cell
        
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! GoalOfTheMonthStats
            cell.info = goalOfTheMonth?.stats
            return cell
        
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! GoalOfTheMonthRateCell
            
//            cell.ratingGraph = goalOfTheMonth.rating[indexPath.row].value
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell6", for: indexPath) as! GoalOfTheMonthNoteCell
            
            cell.info = goalOfTheMonth?.notes
            return cell
            
        default: break
            
        }
        return UITableViewCell()
        
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 27
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 4 {
            return 150
        } else  {
        return 100
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoalOfTheMonthTableViewController" {
            
        } else if segue.identifier == "GoalOfTheMonthTableViewController" {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return array[section]
    }
}
