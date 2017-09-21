//
//  VisitorsFormTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class VisitorsFormTableViewController: BaseTableViewController {
    
    // Properties
    @IBOutlet weak var fullNameTextField: BaseTextField!
    @IBOutlet weak var dateOfBirthTextField: BaseTextField!
    @IBOutlet weak var dateTextField: BaseTextField!
    @IBOutlet weak var mobileNumberTextField: BaseTextField!
    @IBOutlet weak var emailTextField: BaseTextField!
    @IBOutlet weak var remainderTextField: BaseTextField!
    @IBOutlet weak var visitorsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }

    @IBAction func SubmitButtonTapped(_ sender: Any) {
    
        let fullName = fullNameTextField.text!
        let dateOfBirth = dateOfBirthTextField.text!
        let date = dateTextField.text!
        let mobileNumber = mobileNumberTextField.text!
        let email = emailTextField.text!
        let remainder = remainderTextField.text!
        
        if fullName.removeAllSpaces().isEmpty {
            print("fullName all validation")
            
        } else if dateOfBirth.removeAllSpaces().isEmpty {
            print("dateOfBirth all validation")
            
        } else if date.removeAllSpaces().isEmpty {
            print("date all validation")
        } else if mobileNumber.removeAllSpaces().isEmpty {
            print("mobileNumber all validation")
            
        } else if email.removeAllSpaces().isEmpty {
            print("registrationFee all validation")
            
        } else if remainder.removeAllSpaces().isEmpty {
            print("totalPaid all validation")
            
        }  else {
            print("passed all validation")
        }
    }
}
