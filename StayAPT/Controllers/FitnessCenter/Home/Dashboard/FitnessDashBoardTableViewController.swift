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
    
    @IBOutlet weak var nameLabel: MediumLabel!
    @IBOutlet weak var locationLabel: smallLabel!
    @IBOutlet weak var stayaptId: smallLabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var checkedInView: UIView!
    @IBOutlet weak var membersView: UIView!
    @IBOutlet weak var membersFormView: UIView!
    
    @IBOutlet weak var visitorsView: UIView!
    @IBOutlet weak var visitorsFormView: UIView!
    @IBOutlet weak var reportView: UIView!
    @IBOutlet weak var employeesView: UIView!
    
    @IBOutlet weak var sendNotificationView: UIView!
    @IBOutlet weak var totalRevenueView: UIView!
    @IBOutlet weak var dateView: UIView!
    
    var views: [UIView] = []
    
    let user = LoginUtils.getCurrentFitnessCenterUserLogin()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        setup()
        getMembersCount()
        addViewinArray()
        
        checkedInView.tag = 1
        membersView.tag = 2
        membersFormView.tag = 3
        visitorsView.tag = 4
        visitorsFormView.tag = 5
        reportView.tag = 6
        employeesView.tag = 7
        sendNotificationView.tag = 8
        totalRevenueView.tag = 9
        dateView.tag = 10
    }
    
    func addViewinArray() {
        views.append(checkedInView)
        views.append(membersView)
        views.append(membersFormView)
        views.append(visitorsView)
        
        views.append(visitorsFormView)
        views.append(reportView)
        views.append(employeesView)
        views.append(sendNotificationView)
        
        views.append(totalRevenueView)
        views.append(dateView)
        
        for view in views {
            
             let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FitnessDashBoardTableViewController.viewTapped(_:)))
            view.addGestureRecognizer(tapGesture)
        }
    }
    
    func viewTapped(_ sender: UITapGestureRecognizer) {
        showSegue(sender.view!.tag)
    }
    
    func setup() {
        
        let image = UIImage(named: "gym")
        if let url = URL(string: user.logoImage ) {
            imageView.kf.setImage(with: url, placeholder: image)
        } else {
            imageView.image = image
        }
        nameLabel.text = user.fitness_center_name
        locationLabel.text = user.address
        stayaptId.text = user.stayAptId
    }
    
    func getMembersCount() {
        
        let param = ["fcID": "1"]
        DashBoardMembersCountGetService.executeRequest(param) { (data) in
            print(data)
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    func showSegue(_ index: Int) {
        
        switch index {
        case 1:
            performSegue(withIdentifier: "showMembersSegue", sender: self)
            
        case 2:
            performSegue(withIdentifier: "showMembersListSegue", sender: self)
            
        case 3:
            performSegue(withIdentifier: "showMemberFormSegue", sender: self)
            
        case 4:
            performSegue(withIdentifier: "showVisitorsSegue", sender: self)
            
        case 5:
            performSegue(withIdentifier: "showVisitorsFormSegue", sender: self)
            
        case 6:
            performSegue(withIdentifier: "showReportSegue", sender: self)
            
        case 7:
            self.navigationController?.popViewController(animated: true)
            
        case 8:
            performSegue(withIdentifier: "showNotificationSegue", sender: self)
            
        case 9:
            LoginUtils.setCurrentFitnessCenterUserLogin(nil)
            let application = UIApplication.shared.delegate as! AppDelegate
            application.setHomeGuestAsRVC()
            
        default:
            print("out of bound")
        }
    }
}
