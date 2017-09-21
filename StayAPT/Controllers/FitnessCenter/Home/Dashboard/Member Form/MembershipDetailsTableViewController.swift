//
//  MembershipDetailsTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MembershipDetailsTableViewController: BaseTableViewController {

    // properties
    @IBOutlet weak var membershipPlanTextField: BaseTextField!
    @IBOutlet weak var startDateTextField: BaseTextField!
    @IBOutlet weak var endDateTextField: BaseTextField!
    @IBOutlet weak var membershipFeeTextField: BaseTextField!
    @IBOutlet weak var registrationFeeTextField: BaseTextField!
    @IBOutlet weak var totalPaidTextField: BaseTextField!
     @IBOutlet weak var paymentDueTextField: BaseTextField!

    lazy var dateOfBirthDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateOfBirthDatePicker.datePickerMode = .date
        startDateTextField.inputView = dateOfBirthDatePicker
        endDateTextField.inputView = dateOfBirthDatePicker
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        
        let membershipPlan = membershipPlanTextField.text!
        let startDate = startDateTextField.text!
        let endDate = endDateTextField.text!
        let membershipFee = membershipFeeTextField.text!
        let registrationFee = registrationFeeTextField.text!
        let totalPaid = totalPaidTextField.text!
        let paymentDue = paymentDueTextField.text!
 
        
        if membershipPlan.removeAllSpaces().isEmpty {
            print("membershipPlan all validation")
            
        } else if startDate.removeAllSpaces().isEmpty {
            print("startDate all validation")
            
        } else if endDate.removeAllSpaces().isEmpty {
            print("endDate all validation")
        } else if membershipFee.removeAllSpaces().isEmpty {
            print("membershipFee all validation")
            
        } else if registrationFee.removeAllSpaces().isEmpty {
            print("registrationFee all validation")
            
        } else if totalPaid.removeAllSpaces().isEmpty {
            print("totalPaid all validation")
            
        } else if paymentDue.removeAllSpaces().isEmpty {
            print("paymentDue all validation")
            
        } else {
            print("passed all validation")
        }
    }
}
