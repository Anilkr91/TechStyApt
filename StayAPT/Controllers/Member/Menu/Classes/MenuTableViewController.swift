//
//  MenuTableViewController.swift
//  StayAPT
//
//  Created by Macintosh on 22/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MenuTableViewController: BaseTableViewController {

    var dataArray: [ClassModel] = []
    weak var pvc: MenuViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateTableView()
    }
        
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        cell.info = dataArray[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        performSegue(withIdentifier: "showGymSegue", sender: indexPath)
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
    
    func populateTableView() {
        ClassGetService.executeRequest { (data) in
            self.dataArray = data
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGymSegue" {
            let dvc = segue.destination as! FitnessCenterViewController
            let sender = sender as! IndexPath
            dvc.classId = dataArray[sender.section].id
        }
    }
}
