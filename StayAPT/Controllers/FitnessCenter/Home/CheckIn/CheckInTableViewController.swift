//
//  CheckInTableViewController.swift
//  StayAPT
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class CheckInTableViewController: BaseTableViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    var bottomBorder = CALayer()
    
    let user = LoginUtils.getCurrentFitnessCenterUserLogin()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        setupBackgroundImage()
    }
    
    func setupBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.backgroundColor = UIColor.white
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    @IBAction func checkInTapped(_ sender: Any) {
        
        let id = idTextField.text!
        if id.removeAllSpaces().isEmpty {
            Alert.showAlertWithMessage("Error", message: "StayAPTID cannot be empty")
            
        } else {
            let param = CheckInModel(fcID: user.id, stayAptID: id).toJSON()
            
            FCCheckInServicePostService.executeRequest(param! as [String : AnyObject], completionHandler: { (data) in
                Alert.showAlertWithMessage("Success", message: data.response!)
            })
        }
    }
    
    @IBAction func checkoutTapped(_ sender: Any) {
        
        let id = idTextField.text!
        if id.removeAllSpaces().isEmpty {
            Alert.showAlertWithMessage("Error", message: "StayAPTID cannot be empty")
            
        } else {
            let param = CheckInModel(fcID: user.id, stayAptID: id).toJSON()
            
            FCCheckoutPostService.executeRequest(param! as [String : AnyObject], completionHandler: { (data) in
                Alert.showAlertWithMessage("Success", message: "\(String(describing: data.response!)) \(String(describing: data.timeMessage!)) ")
            })
        }
    }
}
