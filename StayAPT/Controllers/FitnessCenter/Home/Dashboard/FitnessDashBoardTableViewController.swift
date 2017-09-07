//
//  FitnessDashBoardTableViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessDashBoardTableViewController: BaseTableViewController {
    
    let fitnessOptions = ["Checked in Members", "Members", "Members Form", "Visitor's List", "Visitor's Form", "Report", "Home", "Notification", "Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fitnessOptions.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = fitnessOptions[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        showSegue(index: indexPath.section)
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
    
    func showSegue(index: Int) {
        
        switch index {
        case 0:
            performSegue(withIdentifier: "showMembersSegue", sender: self)
            
        case 1:
            performSegue(withIdentifier: "showMembersListSegue", sender: self)
            
        case 2:
            performSegue(withIdentifier: "showMemberFormSegue", sender: self)
            
        case 3:
            performSegue(withIdentifier: "showVisitorsSegue", sender: self)
            
        case 4:
            performSegue(withIdentifier: "showVisitorsFormSegue", sender: self)
            
        case 5:
            performSegue(withIdentifier: "showReportSegue", sender: self)
            
        case 6:
            self.navigationController?.popViewController(animated: true)
            
        case 7:
            performSegue(withIdentifier: "showNotificationSegue", sender: self)
        
        default:
            print("out of bound")
        }
    }
}
