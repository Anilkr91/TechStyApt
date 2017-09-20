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
        uploadImageButton.addTarget(self, action: #selector(PersonalDetailTableViewController.uploadButtonTapped(sender:)), for: .touchUpInside)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
    }
    
    func uploadButtonTapped(sender: AnyObject) {
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
        self.imagePickerController.dismiss(animated: true, completion: nil)
        
        print(image)

        
        //        ProgressBarView.showHUD()
        //        let data = self.getDataFromImage(image!)
        //        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        //        configuration.timeoutIntervalForRequest = 60 // seconds
        //        configuration.timeoutIntervalForResource = 60
        //        self.alamoFireManager = Alamofire.Manager(configuration: configuration)
        //        alamoFireManager.upload(
        //            .POST,  Restofire.defaultConfiguration.baseURL + "upload",headers: Restofire.defaultConfiguration.headers,
        //            multipartFormData: { multipartFormData in
        //                multipartFormData.appendBodyPart(data: data, name: "file", fileName: "file", mimeType: "image/png")
        //        },
        //            encodingCompletion: { encodingResult in
        //                switch encodingResult {
        //                case .Success(let upload, _, _):
        //                    upload.responseJSON { JSON in
        //                        if let info = JSON.result.value as? [String: AnyObject] {
        //                            self.imageUrl = "\(info["data"]!)"
        //                            self.displayImageView.image = image
        //                            self.displayImageView.userInteractionEnabled = true
        //                            self.uploadImageButton.hidden = true
        //                            self.optionalLabel.hidden = true
        //
        //                        } else {
        //                            VCErrorUtils.showError(JSON.result.error!.localizedDescription, navigationController: self.navigationController!)
        //                        }
        //                        ProgressBarView.hideHUD()
        //                    }
        //                case .Failure(let encodingError):
        //                    VCErrorUtils.showError(encodingError as! String, navigationController: self.navigationController!)
        //                }
        //        }
        //        )
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    /*func getDataFromImage(image: UIImage) -> NSData {
     if image.size.width < 500 || image.size.height < 500 {
     return UIImageJPEGRepresentation(image, 1.0)!
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
     let size = CGSizeMake(newWidth, newHeight)
     UIGraphicsBeginImageContextWithOptions(size, false, image.scale);
     let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
     image.drawInRect(rect)
     let normalizedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
     UIGraphicsEndImageContext()
     return UIImageJPEGRepresentation(normalizedImage, 1.0)!
     }
     }*/
}
