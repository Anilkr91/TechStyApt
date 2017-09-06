//
//  BlogDetailTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class BlogDetailTableViewController: BaseTableViewController {
    
    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var blogTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    
    var blog: BlogModel?
    
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func setupBlog() {
        
        let url = URL(string: blog!.img)!
        let image = UIImage(named: "gym")
        
        blogImageView.kf.setImage(with: url, placeholder: image)
        blogTitle.text = blog?.title
        dateLabel.text = blog?.datetime
        blogLabel.text = blog?.des
        authorName.text = blog?.name
    }
}
