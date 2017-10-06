//
//  EditProfileTableViewController.swift
//  StayAPT
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftDate

class EditProfileTableViewController: BaseTableViewController {
    
    // Properties
    @IBOutlet weak var aboutMeTextField: BaseTextField!
    @IBOutlet weak var firstNameTextField: BaseTextField!
    @IBOutlet weak var lastNameTextField: BaseTextField!
    @IBOutlet weak var genderSegmentationControl: UISegmentedControl!
    @IBOutlet weak var dateOfBirthTextField: BaseTextField!
    @IBOutlet weak var heightTextField: BaseTextField!
    @IBOutlet weak var weightTextField: BaseTextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    lazy var dateOfBirthDatePicker = UIDatePicker()
    let imagePickerController = UIImagePickerController()
    let tapGesture =  UITapGestureRecognizer()
    let dateFormatter = "YYYY-MM-dd"
    var gender: String = "Male"
    var profile: ProfileResponse! = nil
        
    override func viewDidLoad() {
        super.viewDidLoad()
        dateOfBirthDatePicker.datePickerMode = .date
        dateOfBirthTextField.inputView = dateOfBirthDatePicker
        
        dateOfBirthDatePicker.addTarget(self, action: #selector(EditProfileTableViewController.getDate(sender:)), for: UIControlEvents.valueChanged)
        
        profileImageView.isUserInteractionEnabled  = true
        tapGesture.addTarget(self, action: #selector(EditProfileTableViewController.uploadImage))
        profileImageView.addGestureRecognizer(tapGesture)
        
        setupPreFilledProfile()
    }
    
    func uploadImage() {
        handleImageTapGestureRecognizer()
    }
    
    func segmentIndex(sender: UISegmentedControl?) {
        
        let index = sender!.selectedSegmentIndex
        
        switch index {
        case 0:
            gender = "Male"
        case 1:
            gender = "Female"
        case 2:
            gender = "Other"
            
        default:
            print("out of bound")
        }
    }
    
    func getDate(sender: Any) {
        let selectedDate =  dateOfBirthDatePicker.date
        let dateString =  selectedDate.string(custom: dateFormatter)
        dateOfBirthTextField.text = dateString
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
            
            let user = LoginUtils.getCurrentMemberUserLogin()
            
            let param = ProfileModel(fname: firstName, lname: lastName, loc_id: "1", height: height, weight: weight, about_me: aboutme, gender: gender, birthday: dateOfBirth, userId: user!.id).toJSON()
            
            EditProfilePostService.executeRequest(param! as [String : AnyObject]) { (data) in
                self.navigationController?.popViewController(animated: true)
                Alert.showAlertWithMessage("Success", message: data.response!)
            }
        }
    }
    
    func setupPreFilledProfile() {
        
        //        if let profile = LoginUtils.getCurrentUserProfile() {
        
        let image = UIImage(named: "gym")
        let url = URL(string: profile.userImage)!
        
        profileImageView.kf.setImage(with: url, placeholder: image)
        aboutMeTextField.text! = profile.about_me
        firstNameTextField.text! = profile.fname
        lastNameTextField.text! = profile.lname
        dateOfBirthTextField.text! = profile.birthday
        heightTextField.text!  =  profile.height
        weightTextField.text! = profile.weight
        
        //        }else {
        return
        //        }
    }
}

extension EditProfileTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleImageTapGestureRecognizer() {
        let imagePickerMenu = UIAlertController(title: "Choose image to upload", message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Take photo", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            self.imagePickerController.sourceType = .camera
            self.imagePickerController.cameraDevice = .front
            self.presentImagePickerController()
        })
        
        let galleryAction = UIAlertAction(title: "Choose from Library", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.imagePickerController.sourceType = .photoLibrary
            self.presentImagePickerController()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        imagePickerMenu.addAction(cameraAction)
        imagePickerMenu.addAction(galleryAction)
        imagePickerMenu.addAction(cancelAction)
        
        self.present(imagePickerMenu, animated: true, completion: nil)
    }
    
    func presentImagePickerController() {
        self.imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imagePickerController.dismiss(animated: true, completion: nil)
        
        if let imageData = image?.jpeg(.medium)  {
            
            UploadImagePostService.executeRequest(imageData, image: "", completionHandler: { (response) in
                self.profileImageView.image = image
            })
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}