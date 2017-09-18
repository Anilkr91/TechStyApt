//
//  FitnessDashBoardTableViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class FitnessDashBoardTableViewController: BaseTableViewController {
    
    let fitnessOptions = ["Checked in Members", "Members", "Members Form", "Visitor's List", "Visitor's Form", "Report", "Home", "Notification", "Logout"]
    
    
    @IBOutlet weak var nameLabel: MediumLabel!
    @IBOutlet weak var locationLabel: smallLabel!
    @IBOutlet weak var packageLabel: smallLabel!
    @IBOutlet weak var stayaptId: smallLabel!
    @IBOutlet weak var subscriptionLabel: smallLabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let user = LoginUtils.getCurrentFitnessCenterUserLogin()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        
        let url = URL(string: user.logoImage)!
        let image = UIImage(named: "gym")
        
        imageView.kf.setImage(with: url, placeholder: image)

        nameLabel.text = user.fitness_center_name
        locationLabel.text = user.address
        packageLabel.text = user.owner
        stayaptId.text = user.stayAptId
        subscriptionLabel.text = user.fitness_email
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
            print("out of bound")
            self.navigationController?.popViewController(animated: true)
            
        case 7:
            print("out of bound")
            performSegue(withIdentifier: "showNotificationSegue", sender: self)
            
        case 8:
            print("out of bound")
            self.navigationController?.popToRootViewController(animated: true)
            
        default:
            print("out of bound")
        }
    }
}
