//
//  FitnessCenterLoginTableViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessCenterLoginTableViewController: BaseTableViewController {
    
    @IBOutlet weak var fcTextField: BaseTextField!
    @IBOutlet weak var stayAptIdTextField: BaseTextField!
    @IBOutlet weak var fitnessCenterIdTextField: BaseTextField!
    @IBOutlet weak var passwordTextField: BaseTextField!
    @IBOutlet weak var togglePasswordButton: UIButton!
    var isShowPassword : Bool = false
    
    let array = ["Admin", "Employee"]
    lazy var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fcTextField.inputView = picker
        picker.delegate = self
        
        togglePasswordButton.addTarget(self, action: #selector(toggleButtonImage), for: .touchUpInside)
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
    
    func toggleButtonImage() {
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
        
        let id = fitnessCenterIdTextField.text!
        let password = passwordTextField.text!
        let stayAptId = stayAptIdTextField.text!
        let fitnessCenterType = fcTextField.text!
        var fcId: Int
        
        if fitnessCenterType == "Admin" {
            fcId = 1
            
        } else {
            fcId = 0
        }
        
        if fitnessCenterType.removeAllSpaces().isEmpty {
             Alert.showAlertWithMessage("Error", message: "FitnessCenter Type cannot be empty")
            
        } else if stayAptId.removeAllSpaces().isEmpty {
             Alert.showAlertWithMessage("Error", message: "StayAptId ID cannot be empty")
        }
        
        else if id.removeAllSpaces().isEmpty {
            Alert.showAlertWithMessage("Error", message: "Center ID cannot be empty")
            
        } else if password.removeAllSpaces().isEmpty {
            Alert.showAlertWithMessage("Error", message: "Password cannot be empty")
            
        } else {
            let params = LoginModel(email: "lokesh@techximum.in", password: "123", userType: 2, fcType: fcId, stayAptId: "STAYHFCSD01").toJSON()
            
            FCLoginPostService.executeRequest(params! as [String : AnyObject] , completionHandler: { (data) in
                LoginUtils.setCurrentFitnessCenter(data)
                
                let application = UIApplication.shared.delegate as! AppDelegate
                application.setHomeFitnessCenterUserAsRVC()
                
                // self.performSegue(withIdentifier: "showSignInSegue", sender: self)
            })
            
        }
    }
}


extension FitnessCenterLoginTableViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        fcTextField.text = array[row]
    }
}
