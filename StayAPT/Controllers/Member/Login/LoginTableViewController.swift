//
//  LoginTableViewController.swift
//  StayAPT
//
//  Created by admin on 24/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class LoginTableViewController: BaseTableViewController {
    
    @IBOutlet weak var userIdTextField: BaseTextField!
    @IBOutlet weak var passwordTextField: BaseTextField!
    var isShowPassword : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        tableView.separatorStyle = .none
    }
    
    func setupBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.backgroundColor = UIColor.white
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    @IBAction func togglePassword(_ sender: UIButton) {
        
        if(isShowPassword == true) {
            passwordTextField.isSecureTextEntry = false
            isShowPassword = false
        } else {
            passwordTextField.isSecureTextEntry = true
            isShowPassword = true
        }
    }
}
