//
//  FitnessCenterLoginTableViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessCenterLoginTableViewController: BaseTableViewController {
    
    @IBOutlet weak var fitnessCenterIdTextField: BaseTextField!
    @IBOutlet weak var passwordTextField: BaseTextField!
    @IBOutlet weak var togglePasswordButton: UIButton!
    var isShowPassword : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        togglePasswordButton.addTarget(self, action: #selector(toggleButtonImage(sender:)), for: .touchUpInside)
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let type = Device.userIntefaceType()
        var height: CGFloat = 0.0001
        
        if type == .pad {
            height = 60.0
            
        } else if type == .phone {
            height = UITableViewAutomaticDimension
        }
        return height
    }
    
    func toggleButtonImage(sender: UIButton) {
        let show = UIImage(named: "show")
        let hide = UIImage(named: "hide")
        
        if(isShowPassword == true) {
            passwordTextField.isSecureTextEntry = true
            togglePasswordButton.setImage(hide, for: .normal)
            isShowPassword = false
            
        } else {
            passwordTextField.isSecureTextEntry = false
            isShowPassword = true
            togglePasswordButton.setImage(show, for: .normal)
        }
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "showSignInSegue", sender: self)
        
        //        let id = fitnessCenterIdTextField.text!
        //        let password = passwordTextField.text!
        //
        //        if id.removeAllSpaces().isEmpty {
        //            Alert.showAlertWithMessage(title: "Error", message: "Center ID cannot be empty")
        //
        //        } else if password.removeAllSpaces().isEmpty {
        //            Alert.showAlertWithMessage(title: "Error", message: "Password cannot be empty")
        //
        //        } else {
        //            performSegue(withIdentifier: "showSignInSegue", sender: self)
        //            print("validation passed hit login api")
        //        }
    }
}
