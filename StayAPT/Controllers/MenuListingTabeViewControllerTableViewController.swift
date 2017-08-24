//
//  MenuListingTabeViewControllerTableViewController.swift
//  StayAPT
//
//  Created by admin on 23/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MenuListingTableViewController: BaseTableViewController {
    
    let gymArray = ["GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2","GGym", "GGym2"]
    let blogArray = ["GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2","GGym", "GGym2"]
    let dietArray = ["GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2","GGym", "GGym2"]
    let galleryArray = ["GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2","GGym", "GGym2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuListingTableViewCell
        
        cell.saGymImageView.image = UIImage(imageLiteralResourceName: gymArray[indexPath.section])
        cell.saGymTitleLabel.text = "GYM"
        cell.saGymSubTitleLabe.text = "detailed gym text"
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

 

}
