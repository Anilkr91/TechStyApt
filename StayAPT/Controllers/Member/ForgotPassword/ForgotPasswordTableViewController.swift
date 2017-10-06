//
//  ForgotPasswordTableViewController.swift
//  StayAPT
//
//  Created by admin on 26/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class ForgotPasswordTableViewController: BaseTableViewController {
    
    @IBOutlet weak var emailIdTextField: BaseTextField!
    
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
    
    @IBAction func SubmitTapped(_ sender: Any) {
        
        let id = emailIdTextField.text!
        if id.removeAllSpaces().isEmpty {
            Alert.showAlertWithMessage("Error", message: "email id cannot be empty")
            
        } else {
            
            let param = ["forgot_email" : id, "user" : 1] as [String : Any]
            ForgotPasswordPostService.executeRequest(param) { (data) in
                
                let alertController = UIAlertController(title: "Success", message: data.response!, preferredStyle: .alert)
                
                // Create the actions
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                self.navigationController?.popViewController(animated: true)
                }
               
                // Add the actions
                alertController.addAction(okAction)
                
                // Present the controller
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
