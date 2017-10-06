//
//  VisitiorsListingTableViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class VisitiorsListingTableViewController: UITableViewController {
    
    let memberArray = [
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "John", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "Rohit", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "Rohan", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "Prakash", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "Ankur", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "Bhagat", counter: "9873123782"),
        SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "9873123782")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        getVisitorsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return memberArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VisitorsListingTableViewCell
        
        cell.saVisitorsImageView.image = UIImage(imageLiteralResourceName: memberArray[indexPath.section].image)
        cell.saCallIncomingImageView.image = UIImage(imageLiteralResourceName: memberArray[indexPath.section].image)
        cell.saCallOutgoingImageView.image = UIImage(imageLiteralResourceName: memberArray[indexPath.section].image)
        cell.saVisitorsNameLabel.text = memberArray[indexPath.section].name
        cell.saVisitorsMobileLabel.text = memberArray[indexPath.section].counter
        
        cell.saVisitorsCommentLabel.text = "This is a comment label which contains lots of text This is a comment label which contains lots of text This is a comment label which contains lots of text"
        cell.saFollowUpLastDateLabel.text = "20th Aug 2017"
        cell.saFollowUpNewDateLabel.text = "25th Aug 2017"
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
    
    func getVisitorsList() {
        
        let param = ["fcID": "1"] as [String: AnyObject]
        VisitorsServiceGetService.executeRequest(param) { (data) in
            print(data)
        }
        
    }
}
