//
//  PlaceOfferAlert.swift
//  StayAPT
//
//  Created by admin on 12/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class PlaceOfferAlert: BaseViewController {
    
    @IBOutlet weak var amountTextField: BaseTextField!
    @IBOutlet weak var offerTypeTextField: BaseTextField!
    @IBOutlet weak var titleLabel: UILabel!
    var object: MembershipModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        amountTextField.text = object.monthlyPrice
        offerTypeTextField.text = object.membershipPlanMonthly
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        let amount = amountTextField.text!
        let offerType = offerTypeTextField.text!
        
        let param = PlaceOfferModel(user_id: "22", fcid: "1", offerType: offerType, amount: amount).toJSON()
        
        PlaceOfferPostService.executeRequest(param!) { (data) in
//            Alert.showAlertWithMessage("Success", message: data.message!)
            self.dismiss(animated: true, completion: nil)
        }
    }
}

/*extension PlaceOfferAlert: UIPickerViewDelegate {
 
 func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
 
 if pickerView.tag == 0 {
 return array.count
 } else if pickerView.tag == 1 {
 return array.count
 }
 return 1
 }
 
 func numberOfComponents(in pickerView: UIPickerView) -> Int {
 return 1;
 }
 
 func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
 
 if pickerView.tag == 0 {
 return array[row].featuresMonthly[row]
 } else if pickerView.tag == 1 {
 return array[row].monthlyPrice
 }
 return ""
 }
 
 func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
 
 if pickerView.tag == 0 {
 return amountTextField.text = array[row].monthlyPrice
 } else if pickerView.tag == 1 {
 return offerTypeTextField.text = array[row].featuresMonthly[row]
 }
 }
 }*/
