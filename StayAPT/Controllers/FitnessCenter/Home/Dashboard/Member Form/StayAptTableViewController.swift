//
//  StayAptTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class StayAptTableViewController: BaseTableViewController {

    // properties
    @IBOutlet weak var sourceTextField: BaseTextField!
    @IBOutlet weak var membershipNumberTextField: BaseTextField!
    @IBOutlet weak var salesPersonTextField: BaseTextField!
    @IBOutlet weak var generateStayAptCodeTextField: BaseTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
}
