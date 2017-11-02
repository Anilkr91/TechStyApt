//
//  EmployeeListTableViewController.swift
//  StayAPT
//
//  Created by admin on 02/11/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class EmployeeListTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let param = ["fcID": "1"]
        
     EmployeeListGetService.executeRequest(param) { (data) in
    print(data)
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
