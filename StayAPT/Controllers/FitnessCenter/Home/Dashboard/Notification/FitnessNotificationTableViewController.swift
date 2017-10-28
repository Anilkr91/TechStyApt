//
//  FitnessNotificationTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessNotificationTableViewController: BaseTableViewController {
    
     var notificationArray: [NotificationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateTableView()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return notificationArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if notificationArray[indexPath.section].notificationName == Notification.Offer.rawValue || notificationArray[indexPath.section].notificationName == Notification.Booking.rawValue
        || notificationArray[indexPath.section].notificationName == Notification.Workout.rawValue{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as! FitnessInformationTableViewCell
            cell.member = notificationArray[indexPath.section]
            return cell
            
        }
        /*else if notificationArray[indexPath.section].type == Notification.Request.rawValue {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! FitnessNotificationTableViewCell
            cell.notificationAcceptButton.tag = indexPath.section
            cell.notificationRejectButton.tag = indexPath.section
            cell.member = notificationArray[indexPath.section]
            return cell
        } */
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
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
    
    func populateTableView() {
        
        let param = ["fcID": "1"]
        
        FitnessCenterNotificationGetService.executeRequest(param) { (response) in
            self.notificationArray = response
            self.tableView.reloadData()
        }
    }
}
