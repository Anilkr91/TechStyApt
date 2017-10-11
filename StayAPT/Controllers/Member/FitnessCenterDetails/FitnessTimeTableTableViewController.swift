//
//  FitnessTimeTableTableViewController.swift
//  StayAPT
//
//  Created by admin on 11/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessTimeTableTableViewController: UITableViewController {
    
    var timeTable: [TimeTableSundayResponse] = []
    var array: [Any] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTimeTableArray()
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    func setupTimeTableArray() {
        
            for time in timeTable.enumerated() {
                array.append(time.element.sunday)
                array.append(time.element.monday)
                 array.append(time.element.tuesday)
                 array.append(time.element.wednesday)
                 array.append(time.element.thursday)
                 array.append(time.element.friday)
                array.append(time.element.saturday)
//    array.append(time.element.sunday)
        //
//                    for value in time.element.sunday!.enumerated() {
//                        
//                      let sunday = TimeTableModel(status: value.element.status!, singleSession: value.element.singleSession!, coupleSession: value.element.coupleSession!, freeSession: value.element.freeSession!, class_id: value.element.class_id!, days: value.element.days!, duration: value.element.duration!, start: value.element.start!, className: value.element.className!)
//                        
//                        array.append(sunday)
//                        
//                    }
        }
        let list = array.filter { $0 != nil }
     print(list)
    }
}
