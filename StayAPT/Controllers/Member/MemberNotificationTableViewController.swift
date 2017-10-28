//
//  MemberNotificationTableViewController.swift
//  StayAPT
//
//  Created by admin on 25/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import UIKit

class MemberNotificationTableViewController: BaseTableViewController {
    
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
        
        if notificationArray[indexPath.section].notificationName == Notification.Booking.rawValue {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! MemberNotificationTableViewCell
            print(notificationArray[indexPath.section])
            cell.member = notificationArray[indexPath.section]
            return cell
        }
        
        //        } else if notificationArray[indexPath.section].type == Notification.Request.rawValue {
        //
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! FitnessNotificationTableViewCell
        //            cell.notificationAcceptButton.tag = indexPath.section
        //            cell.notificationRejectButton.tag = indexPath.section
        //            cell.member = notificationArray[indexPath.section]
        //            return cell
        //         }
        
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
        
        let param = ["userId": "22"]
        
        MemberNotificationGetService.executeRequest(param) { (response) in
            
            self.notificationArray = response
            self.tableView.reloadData()
        }
    }
    
}
