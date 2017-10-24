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
    var array: [FacilitiesCenterDetailsTimeTable] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTimeTableArray()
        print(array)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FitnessCenterTimeTableCell
        
        cell.info = array[indexPath.row]
        return cell
    }
    
    func setupTimeTableArray() {
        
            for time in timeTable.enumerated() {
                
                if let sundays = time.element.sunday {
                    
                    for day in sundays{
                        array.append(day)
                    }
                }
                
                if let mondays = time.element.monday {
                    
                    for day in mondays{
                        array.append(day)
                    }
                }
                
                if let tuesdays = time.element.tuesday {
                    
                    for day in tuesdays{
                        array.append(day)
                    }
                }
            
                if let wednesdays = time.element.wednesday {
                
                    for day in wednesdays{
                        array.append(day)
                    }
                }
                
                if let thursdays = time.element.thursday {
                    
                    for day in thursdays{
                         array.append(day)
                    }
                }
                
                if let fridays = time.element.friday {
                    
                    for day in fridays{
                        array.append(day)
                    }
                }
                
                if let saturdays = time.element.saturday {
                    
                    for day in saturdays{
                        array.append(day)
                    }
                }
        }
    }
}
