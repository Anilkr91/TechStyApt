//
//  FitnessBuddyTableViewController.swift
//  StayAPT
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessBuddyTableViewController: BaseTableViewController {
    
    //var dataArray: [ClassModel] = []
   // weak var pvc: MenuViewController?
    
    let dataArray  = [SACheckedInMember(image: "GGym", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM")
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        populateTableView()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FitnessBuddyTableViewCell
        cell.info = dataArray[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        //performSegue(withIdentifier: "showGymSegue", sender: self)
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
    
//    func populateTableView() {
//        ClassGetService.executeRequest { (data) in
//            self.dataArray = data
//            self.tableView.reloadData()
//        }
//    }
}
