//
//  FitnessBuddyTableViewController.swift
//  StayAPT
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessBuddyTableViewController: BaseTableViewController, UISearchResultsUpdating {
    
    //var dataArray: [ClassModel] = []
   // weak var pvc: MenuViewController?
    
    let dataArray  = [SACheckedInMember(image: "GGym", name: "Rajeev", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Lokesh", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Ankur", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Harsharan", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Sojo", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Anil", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Bhagat", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Nikhil", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym", name: "Ashwani", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM"),
                      SACheckedInMember(image: "GGym2", name: "Dhruv", counter: "Anytime Fitness \n thu, 6 july 2017 6:11PM")
                ]
    
     var filteredArray = [SACheckedInMember]()
     let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredArray = dataArray
        setupSearchController()
        //        populateTableView()
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FitnessBuddyTableViewCell
        cell.info = filteredArray[indexPath.section]
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
    
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredArray = dataArray
        } else {
            // Filter the results
            filteredArray = dataArray.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.tableView.reloadData()
    }
}
