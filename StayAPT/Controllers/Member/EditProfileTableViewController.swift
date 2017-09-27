//
//  EditProfileTableViewController.swift
//  StayAPT
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class EditProfileTableViewController: BaseTableViewController {
    
    // Properties
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
    
    
    @IBAction func SubmitTapped(_ sender: Any) {
        
        let aboutme = aboutMeTextField.text!
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let dateOfBirth = dateOfBirthTextField.text!
        let height = heightTextField.text!
        let weight = weightTextField.text!
        
        
        
        
        if aboutme.removeAllSpaces().isEmpty {
            print("aboutme all validation")
            
        } else if firstName.removeAllSpaces().isEmpty {
            print("firstName all validation")
            
        } else if lastName.removeAllSpaces().isEmpty {
            print("lastName all validation")
        } else if dateOfBirth.removeAllSpaces().isEmpty {
            print("dateOfBirth all validation")
            
        } else if height.removeAllSpaces().isEmpty {
            print("height all validation")
            
        } else if weight.removeAllSpaces().isEmpty {
            print("weight all validation")
            
        } else {
            print("passed all validation")
            
            
        let param = ProfileModel(user_photo: "", userImage: "", fname: firstName, lname: lastName, loc_id: "", height: height, weight: weight, about_me: aboutme, gender: "", birthday: dateOfBirth).toJSON()
            
        EditProfilePostService.executeRequest(param!, completionHandler: { (data) in
            print(data)
        })
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
}

/*
 extension EditProfileTableViewController: UIPickerViewDelegate {
 
 func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
 return ageGroupInfo.count
 }
 
 func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
 return ageGroupInfo[row].title
 }
 
 func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
 selectedAgeGroupInfo = ageGroupInfo[row]
 ageGroupTextField.text = ageGroupInfo[row].title
 }
 }*/
