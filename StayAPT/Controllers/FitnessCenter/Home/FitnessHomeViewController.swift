//
//  FitnessHomeViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessHomeViewController: BaseViewController {
    
    
    let user = LoginUtils.getCurrentFitnessCenterUserLogin()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
    }
    
    func setupBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "fitness-bg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.backgroundColor = UIColor.white
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func dashBoardButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Please Confirm Password!", message: "We already have your UserID.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField) -> Void in
            
            textField.placeholder = "Enter Your Password"
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            }
            let okAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                
                if let field = alertController.textFields![0] as UITextField? {
                    
                    if field.text!.isEmpty {
                        print("empty")
                        
                    } else {
//                        let password = field.text!
//                        
//                        let params = LoginModel(email: self.user.fitness_email, password: password, userType: 2).toJSON()
//                        
//                        FCLoginPostService.executeRequest(params: params! as [String : AnyObject] , completionHandler: { (data) in
//                            print(data)
//                            LoginUtils.setCurrentFitnessCenter(user: data)
                            self.performSegue(withIdentifier: "showDashBoardSegue", sender: self)
                        //})
                        
                    }
                    
                }
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
}
