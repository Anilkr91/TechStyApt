 //
// FitnessCenterTableViewController.swift
//  StayAPT
//
//  Created by admin on 23/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessCenterTableViewController: BaseTableViewController {
    
    weak var pvc: FitnessCenterViewController?
    var fitnessCenterArray: [FitnessCenterModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let pvc = pvc {
             populateTableView(classId: pvc.classId!)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fitnessCenterArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuListingTableViewCell
        cell.info = fitnessCenterArray[indexPath.section]
        return cell
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
    
    func populateTableView(classId: String) {
        let param = ["class_id": classId]
        FitnessCenterGetService.executeRequest(params: param as [String : AnyObject]) { (data) in
            self.fitnessCenterArray = data
            self.tableView.reloadData()
        }
    }
}
