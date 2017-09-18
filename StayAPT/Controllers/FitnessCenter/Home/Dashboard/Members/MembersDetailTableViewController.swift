//
//  MembersDetailTableViewController.swift
//  StayAPT
//
//  Created by admin on 18/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MembersDetailTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBarButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MembersDetailTableViewController.self.editDetails(sender:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func editDetails(sender: Any) {
        performSegue(withIdentifier: "showMemberFormSegue", sender: self)
        
    }
}
