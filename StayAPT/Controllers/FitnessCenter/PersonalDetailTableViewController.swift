//
//  PersonalDetailTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class PersonalDetailTableViewController: BaseTableViewController {
    
    //Properties
    @IBOutlet weak var aboutMeTextField: BaseTextField!
    @IBOutlet weak var firstNameTextField: BaseTextField!
    @IBOutlet weak var lastNameTextField: BaseTextField!
    @IBOutlet weak var genderSegmentationControl: UISegmentedControl!
    @IBOutlet weak var dateOfBirthTextField: BaseTextField!
    @IBOutlet weak var heightTextField: BaseTextField!
    @IBOutlet weak var weightTextField: BaseTextField!
    
    
    lazy var dateOfBirthDatePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateOfBirthDatePicker.datePickerMode = .date
        dateOfBirthTextField.inputView = dateOfBirthDatePicker

    }
}
