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
    @IBOutlet weak var togglePassword: UIButton!
    var isShowPassword : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //test
       // loginApi()
        //locationApi()
        regiterApi()
        
        
        togglePassword.addTarget(self, action: #selector(toggleButtonImage(sender:)), for: .touchUpInside)
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
            togglePassword.setImage(hide, for: .normal)
            isShowPassword = false
            
        } else {
            passwordTextField.isSecureTextEntry = false
            isShowPassword = true
            togglePassword.setImage(show, for: .normal)
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let id = userIdTextField.text!
        let password = passwordTextField.text!
        
        if id.removeAllSpaces().isEmpty {
            Alert.showAlertWithMessage(title: "Error", message: "User id cannot be empty")
            
        } else if password.removeAllSpaces().isEmpty {
            Alert.showAlertWithMessage(title: "Error", message: "Password cannot be  empty")
            
        } else {
            print("validation passed hit login api")
        }
    }
    
    func loginApi() {
        
        let params = LoginModel(email: "abcd@gmail.com", password: "123456789", userType: 1).toJSON()
        
        LoginPostService.executeRequest(params: params as! [String : AnyObject]) { (response) in
            print(response)
        }
        
    }
    
    func locationApi() {
      LocationGetService.executeRequest { (data) in
        print(data)
        }
    }
    
    
    func regiterApi() {
        
        let params = RegisterModel(name: "XYZ", email: "XYZ@gmail.com", password: "123456789", userType: 1).toJSON()
        
        RegisterPostService.executeRequest(params: params as! [String : AnyObject]) { (data) in
            print(data)
        }
        
    }
}
