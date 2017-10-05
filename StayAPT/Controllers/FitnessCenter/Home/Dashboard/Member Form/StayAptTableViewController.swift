//
//  StayAptTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class StayAptTableViewController: BaseTableViewController {
    
    let array = ["SP1", "SP2", "SP3", "SP4", "SP5"]
    
    // properties
    @IBOutlet weak var sourceTextField: BaseTextField!
    @IBOutlet weak var membershipNumberTextField: BaseTextField!
    @IBOutlet weak var salesPersonTextField: BaseTextField!
    @IBOutlet weak var generateStayAptCodeTextField: BaseTextField!
    
    lazy var picker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        salesPersonTextField.inputView = picker
        picker.delegate = self
        getSalesPerson()
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
}


extension StayAptTableViewController: UIPickerViewDelegate {
    
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
        
        salesPersonTextField.text = array[row]
    }
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        
        let source = sourceTextField.text!
        let membershipNumber = membershipNumberTextField.text!
        let salesPerson = salesPersonTextField.text!
        let generateStayAptCode = generateStayAptCodeTextField.text!
        
        if source.removeAllSpaces().isEmpty {
            print("source all validation")
            
        } else if membershipNumber.removeAllSpaces().isEmpty {
            print("membershipNumber all validation")
            
        } else if salesPerson.removeAllSpaces().isEmpty {
            print("salesPerson all validation")
        
        } else if generateStayAptCode.removeAllSpaces().isEmpty {
            print("generateStayAptCode all validation")
            
        }   else {
            print("passed all validation")
        }
    }
    
    
    func getSalesPerson() {
        
        let param = ["fcID": "1"] as [String: AnyObject]
        SalesPersonGetService.executeRequest(param) { (data) in
            print(data)
        }
    }
}
