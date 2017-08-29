//
//  MenuTableViewController.swift
//  StayAPT
//
//  Created by Macintosh on 22/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MenuTableViewController: BaseTableViewController {

    var gymArray = ["gym1", "gym2", "gym", "gym1", "gym2", "gym","gym1", "gym2", "gym", "gym1", "gym2"]
    
    var dataArray: [ClassModel] = []
    weak var pvc: MenuViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return gymArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        cell.saImageView.image = UIImage(imageLiteralResourceName: gymArray[indexPath.section])
        cell.saTitleLabel.text = "GYM"
        cell.saSubTitleLabe.text = "Your Fitness Center"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        performSegue(withIdentifier: "showGymSegue", sender: self)
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
            
            for (k,v) in self.dataArray.enumerated() {
                print(self.dataArray[k].id)
                print(self.dataArray[k].className)
                print(self.dataArray[k].img)
            }
        }
        
    }
}
