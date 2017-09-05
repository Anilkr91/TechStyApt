//
//  BlogsTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class BlogsTableViewController: BaseTableViewController {
    
    var array: [BlogModel] = []
    var blog: BlogModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateBlogTableView()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!BlogsTableViewCell
        cell.info = array[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.blog = array[indexPath.row]
        performSegue(withIdentifier: "showBlogDetailSegue", sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func populateBlogTableView() {
        BlogGetService.executeRequest { (data) in
            self.array = data
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBlogDetailSegue" {
            let dvc = segue.destination as! BlogDetailTableViewController
            dvc.blog = blog
        }
    }
}
