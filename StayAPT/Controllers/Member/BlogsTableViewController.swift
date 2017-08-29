//
//  BlogsTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class BlogsTableViewController: UITableViewController {
    
    let memberArray = [ SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
                        SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memberArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!BlogsTableViewCell
        cell.info = memberArray[indexPath.row]
        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showBlogDetailSegue", sender: self)
    }

    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}
