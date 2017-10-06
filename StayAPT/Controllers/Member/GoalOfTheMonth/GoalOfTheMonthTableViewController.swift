//
//  GoalOfTheMonthTableViewController.swift
//  StayAPT
//
//  Created by admin on 04/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class  GoalOfTheMonthTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDailyWeightSegue", sender: self)
    }
}
