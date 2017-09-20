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
}
