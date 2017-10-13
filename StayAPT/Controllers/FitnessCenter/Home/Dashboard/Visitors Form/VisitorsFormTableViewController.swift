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
    @IBOutlet weak var salesPersonTextField: BaseTextField!
    @IBOutlet weak var visitorsTextView: UITextView!
    
    lazy var picker = UIPickerView()
    var array: [SalesPersonModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salesPersonTextField.inputView =  picker
        picker.delegate = self
        getSalesPerson()
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
        
//        if fullName.removeAllSpaces().isEmpty {
//            print("fullName all validation")
//            
//        } else if dateOfBirth.removeAllSpaces().isEmpty {
//            print("dateOfBirth all validation")
//            
//        } else if date.removeAllSpaces().isEmpty {
//            print("date all validation")
//        } else if mobileNumber.removeAllSpaces().isEmpty {
//            print("mobileNumber all validation")
//            
//        } else if email.removeAllSpaces().isEmpty {
//            print("registrationFee all validation")
//            
//        } else if remainder.removeAllSpaces().isEmpty {
//            print("totalPaid all validation")
//            
//        }  else {
        
            guard let fc = LoginUtils.getCurrentFitnessCenterUserLogin() else { return }
        
        print(fc)
            let param = VisitorsFormModel(fcId: fc.id, name: "ABC", dob: "12-04-1991", date: "21 sep 2017", mobile: "9968365956", email: "xyz@gmail.com", reminder: "reminder", notes: "notes", salesPerson: "XYZ", visitStatus: "warm", fcName: fc.fitness_center_name, fcEmail: fc.fitness_email).toJSON()
            
            
            AddVisitorsPostService.executeRequest(param! as [String : AnyObject], completionHandler: { (data) in
                print(data)
            })
            print("passed all validation")
//        }
    }
    
    func getSalesPerson() {
        
        let param = ["fcID": "1"] as [String: AnyObject]
        SalesPersonGetService.executeRequest(param) { (data) in
            self.array = data
            print(data)
        }
    }
    
    func submitForm() {
        
    }
}

extension VisitorsFormTableViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return array[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        salesPersonTextField.text = array[row].name
    }
}
