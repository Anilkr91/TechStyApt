//
//  LoginTableViewController.swift
//  StayAPT
//
//  Created by admin on 24/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class LoginTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView?.backgroundColor = UIColor.clear
        setupBackgroundImage()
        
         tableView.backgroundColor = UIColor.clear
        
        
        
//        tableView.backgroundColor = UIColor.clearColor()
//        tableFooterView?.backgroundColor = UIColor.clearColor()
//        separatorColor = UIColor.clearColor()
    }
    
    func setupBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
