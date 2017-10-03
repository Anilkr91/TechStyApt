//
//  PersonalDetailTableViewController.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Alamofire

class PersonalDetailTableViewController: BaseTableViewController {
    
    //Properties
    @IBOutlet weak var fullNameTextField: BaseTextField!
    @IBOutlet weak var dateOfBirthTextField: BaseTextField!
    @IBOutlet weak var anniversaryTextField: BaseTextField!
    @IBOutlet weak var genderSegmentationControl: UISegmentedControl!
    @IBOutlet weak var mobileNumberTextField: BaseTextField!
    @IBOutlet weak var emergencyNumberTextField: BaseTextField!
    @IBOutlet weak var emailTextField: BaseTextField!
    @IBOutlet weak var uploadImageButton: UIButton!
    
    let imagePickerController = UIImagePickerController()
    lazy var dateOfBirthDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateOfBirthDatePicker.datePickerMode = .date
        dateOfBirthTextField.inputView = dateOfBirthDatePicker
        anniversaryTextField.inputView = dateOfBirthDatePicker
        uploadImageButton.addTarget(self, action: #selector(PersonalDetailTableViewController.uploadButtonTapped), for: .touchUpInside)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    func uploadButtonTapped() {
        handleImageTapGestureRecognizer()
    }
}

extension PersonalDetailTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
//        self.imagePickerController.dismiss(animated: true, completion: nil)
        
//        let size = calculateImageSize(image!)
//        print("size of image in MB: %f ", Double(size) / 1024.0 / 1024.0)
//        
        if let data = image?.jpeg(.medium) {
//
//            let compressedLength = calculateSizeFromData(data)
//            print("size of image in MB: %f ", Double(compressedLength) / 1024.0 / 1024.0)
//            //print(imageData.count)
            
            
            let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
            let BaseUrl = Constants.BASE_URL

            
            let parameters: Parameters = [
                "userId" : "25",
                "oldImage" : ""
            ]
            
            let request =  Alamofire.upload(multipartFormData:{ multipartFormData in
                
                multipartFormData.append(data, withName: "newImage", fileName: "image", mimeType: "image/png")
                
                
                for (key,value) in parameters {
                    
                    multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
               
                
                } },
                                            usingThreshold:UInt64.init(),
                                            to: BaseUrl + "user/profile/profileImage",
                                            method:.post,
                                            headers: header,
                                            encodingCompletion: { encodingResult in
                                                
                                                switch encodingResult {
                                                    
                                                case .success(let upload, _, _):
                                                    
                                                    debugPrint(upload)
                                                    
                                                    upload.responseJSON { response in
                                                        
                                                        debugPrint(response)
                                                    }
                                                    
                                                case .failure(let encodingError):
                                                    print(encodingError)
                                                }
            })
            
            
            
            
            
            
            
            
            
        }
//
//        //        ProgressBarView.showHUD()
//        let data = self.getDataFromImage(image!)
//        countDataInMB(data: data as NSData)
//        
//        let imagewithimagedata = UIImage(data: data as Data)
//        print(imagewithimagedata?.size.width)
//        print(imagewithimagedata?.size.height)
//        
//        let compressedLength = calculateSizeFromData(data as Data)
//        print("size of image in MB: %f ", Double(compressedLength) / 1024.0 / 1024.0)

        
        
        

        
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func getDataFromImage(_ image: UIImage) -> Data {
        if image.size.width < 500 || image.size.height < 500 {
            return UIImageJPEGRepresentation(image, 1.0)! as Data
        } else {
            var newWidth: CGFloat = 500
            var newHeight: CGFloat = 500
            if image.size.width > image.size.height {
                let scale = newHeight / image.size.height
                newHeight = image.size.height * scale
                newWidth = image.size.width * scale
            } else if image.size.width == image.size.height {
                
            } else {
                let scale = newWidth / image.size.width
                newHeight = image.size.height * scale
                newWidth = image.size.width * scale
            }
            let size = CGSize(width: newWidth, height: newHeight)
            UIGraphicsBeginImageContextWithOptions(size, false, image.scale);
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            image.draw(in: rect)
            let normalizedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return UIImageJPEGRepresentation(normalizedImage, 1.0)! as Data
        }
    }
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        
        let fullName = fullNameTextField.text!
        let dateOfBirth = dateOfBirthTextField.text!
        let anniversary = anniversaryTextField.text!
        let mobileNumber = mobileNumberTextField.text!
        let emergencyNumber = emergencyNumberTextField.text!
        let email = emailTextField.text!
        
        if fullName.removeAllSpaces().isEmpty {
            print("fullName all validation")
            
        } else if dateOfBirth.removeAllSpaces().isEmpty {
            print("dateOfBirth all validation")
            
        } else if anniversary.removeAllSpaces().isEmpty {
            print("anniversary all validation")
        } else if mobileNumber.removeAllSpaces().isEmpty {
            print("mobileNumber all validation")
            
        } else if emergencyNumber.removeAllSpaces().isEmpty {
            print("emergencyNumber all validation")
            
        } else if email.removeAllSpaces().isEmpty {
            print("email all validation")
            
        }  else {
            print("passed all validation")
        }
    }
    
    
    // Test Methods
    func calculateImageSize(_ image: UIImage) -> Int {
        print(image.size.width)
        print(image.size.height)
        
        let imgData: Data = NSData(data: UIImageJPEGRepresentation((image), 1)!) as Data
        let imageSize: Int = imgData.count
        return imageSize
    }
    
    // Test Methods
    func calculateSizeFromData(_ data: Data) -> Int {
        let imagewithimagedata = UIImage(data: data)
        print(imagewithimagedata?.size.width)
        print(imagewithimagedata?.size.height)
        
        let imageSize: Int = data.count
        return imageSize
    }
    
    // Test Methods
    func countDataInMB(data: NSData) {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB] // optional: restricts the units to MB only
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(data.length))
        print("formatted result: \(string)")
    }
}
