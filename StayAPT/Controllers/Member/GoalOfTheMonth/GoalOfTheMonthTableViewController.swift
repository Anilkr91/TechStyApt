//
//  GoalOfTheMonthTableViewController.swift
//  StayAPT
//
//  Created by admin on 04/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import MZFormSheetPresentationController

class  GoalOfTheMonthTableViewController: BaseTableViewController {
    
    let array = ["Goal Of The Month", "Ultimate Goal", "Fitness Center", "My WorkOut", "My Stats", "Rate Yourself", "Note"]
    var goalOfTheMonth: GoalOfTheMonthModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoalOfTheMonth()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "showDailyWeightSegue", sender: self)
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
            return count
            
        case 3:
            guard let count = goalOfTheMonth?.workOut.count else { return 1 }
            return count
           
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
            cell.editButton.addTarget(self, action: #selector(editGoalOfTheMonth), for: .touchUpInside)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! UltimateGoalOfTheMonth
            
            cell.info = goalOfTheMonth?.ultimateGoal
            cell.editButton.addTarget(self, action: #selector(editUltimateGoalOfTheMonth), for: .touchUpInside)
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
            cell.editButton.addTarget(self, action: #selector(editStats), for: .touchUpInside)
            return cell
            
        case 5:
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! GoalOfTheMonthRateCell
            cell.info = goalOfTheMonth?.rating
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell6", for: indexPath) as! GoalOfTheMonthNoteCell
            
            cell.info = goalOfTheMonth?.notes
            cell.editButton.addTarget(self, action: #selector(editNotes), for: .touchUpInside)
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
       
        } else if indexPath.section == 5 {
            return 220
            
        } else  {
            return UITableViewAutomaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showUltimateGoalSegue" {
            
            let presentationSegue = segue as! MZFormSheetPresentationViewControllerSegue
            let navigationController = presentationSegue.formSheetPresentationController.contentViewController as! UltimateGoalOfTheMonthAlert
            let formSheetController = MZFormSheetPresentationViewController(contentViewController: navigationController)
            formSheetController.presentationController?.contentViewSize = CGSize(width: 280, height: 350)
            formSheetController.presentationController?.shouldCenterVertically = true
            formSheetController.contentViewControllerTransitionStyle = .bounce
            formSheetController.presentationController?.shouldDismissOnBackgroundViewTap = true
            self.present(formSheetController, animated: true, completion: nil)
            navigationController.titleLabel.text = " Edit Ultimate Goal"
            
            
        } else if segue.identifier == "showEditGoalOfMonthSegue" {
            
            let presentationSegue = segue as! MZFormSheetPresentationViewControllerSegue
            let navigationController = presentationSegue.formSheetPresentationController.contentViewController as! GoalOfTheMonthAlert
            let formSheetController = MZFormSheetPresentationViewController(contentViewController: navigationController)
            formSheetController.presentationController?.contentViewSize = CGSize(width: 280, height: 350)
            formSheetController.presentationController?.shouldCenterVertically = true
            formSheetController.contentViewControllerTransitionStyle = .bounce
            formSheetController.presentationController?.shouldDismissOnBackgroundViewTap = true
            self.present(formSheetController, animated: true, completion: nil)
            navigationController.titleLabel.text =  "Edit Goal"
            
        } else if segue.identifier == "showEditNotesSegue" {
            
            let presentationSegue = segue as! MZFormSheetPresentationViewControllerSegue
            let navigationController = presentationSegue.formSheetPresentationController.contentViewController as! GoalOfTheMonthNotesAlert
            let formSheetController = MZFormSheetPresentationViewController(contentViewController: navigationController)
            
            formSheetController.presentationController?.contentViewSize = CGSize(width: 280, height: 350)
            formSheetController.presentationController?.shouldCenterVertically = true
            formSheetController.contentViewControllerTransitionStyle = .bounce
            formSheetController.presentationController?.shouldDismissOnBackgroundViewTap = true
            self.present(formSheetController, animated: true, completion: nil)
            navigationController.titleLabel.text = " Edit Notes"
            
        }else if segue.identifier == "showEditStatsSegue" {
            
            let presentationSegue = segue as! MZFormSheetPresentationViewControllerSegue
            let navigationController = presentationSegue.formSheetPresentationController.contentViewController as! GoalOfTheMonthStatsAlert
            let formSheetController = MZFormSheetPresentationViewController(contentViewController: navigationController)
            
            formSheetController.presentationController?.contentViewSize = CGSize(width: 280, height: 385)
            formSheetController.presentationController?.shouldCenterVertically = true
            formSheetController.contentViewControllerTransitionStyle = .bounce
            formSheetController.presentationController?.shouldDismissOnBackgroundViewTap = true
            self.present(formSheetController, animated: true, completion: nil)
            navigationController.navigationItem.title = "Edit Stats"

        }else if segue.identifier == "GoalOfTheMonthTableViewController" {
            return
        }else {
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return array[section]
    }
}

extension GoalOfTheMonthTableViewController {
    
    func editGoalOfTheMonth() {
        performSegue(withIdentifier: "showEditGoalOfMonthSegue", sender: self)
    }
    
    func editUltimateGoalOfTheMonth() {
        performSegue(withIdentifier: "showUltimateGoalSegue", sender: self)
    }
    
    func editNotes() {
        performSegue(withIdentifier: "showEditNotesSegue", sender: self)
    }
    
    func editStats() {
        performSegue(withIdentifier: "showEditStatsSegue", sender: self)
    }
    
    func editRateYourself() {
        performSegue(withIdentifier: "", sender: self)
    }
}
