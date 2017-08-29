//
//  BlogDetailTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class BlogDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var blogTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBlog()
    }
    
    @IBAction func BlogShare(_ sender: Any) {
        
        let textToShare = "Checkout this cool blog"
        if let appLink = NSURL(string: "http://www.healthline.com/health/fitness-exercise/best-blogs-of-the-year")
        {
            let objectsToShare = [textToShare, appLink] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.assignToContact, UIActivityType.addToReadingList,UIActivityType.copyToPasteboard,UIActivityType.saveToCameraRoll,UIActivityType.print]
            self.present(activityVC, animated: true, completion: nil)
        }
        
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
    
    func setupBlog() {
        blogImageView.image = UIImage(imageLiteralResourceName: "gym")
        blogTitle.text = "The Importance of good eating habits"
        dateLabel.text = "22, jun-2017"
        blogLabel.text = "If you’re looking for new food ideas that are healthy and delicious then you’ve come to the right place. These are the very best “clean and lean” cooking blogs online, as nominated by readers like you.There are literally thousands of cooking blogs on the web, but we are only interested in those that are truly “clean and lean”. What’s that mean? Well, the blogs included here are reliably healthy. Their recipes avoid the junk and focus on creating meals with life-giving whole foods.If you are looking for clean recipe ideas, ones that will help you stay lean, fit, and healthy, then you will fall in love with our award winners in this list.So without further ado, and in no particular order, here are the top healthy food blogs that you can count on for clean and lean meal ideas"
        authorName.text = "Rohit Khetan"
    }
}
