//
//  ProfileViewController.swift
//  StayAPT
//
//  Created by admin on 05/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var profile: ProfileResponse! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let user = LoginUtils.getCurrentMemberUserLogin()
        let param = ["userId": user!.id] as [String : AnyObject]
        
        
//        if let profile = LoginUtils.getCurrentUserProfile() {
//            setupView(profile: profile)
//            
//        } else {
            ProfileGetService.executeRequest(param) { (response) in
                self.profile = response
                LoginUtils.setCurrentUserProfile(response)
                self.setupView()
                
//            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        let name = "\(profile.fname) \(profile.lname)"
        let image = UIImage(named: "gym")
        let url = URL(string: profile.userImage)!
        nameLabel.text = name
        aboutMeLabel.text = profile.about_me
        profileImageView.kf.setImage(with: url, placeholder: image)
    }
    
    func setupView(profile: ProfileResponse) {
        let name = "\(profile.fname) \(profile.lname)"
        let image = UIImage(named: "gym")
        let url = URL(string: profile.userImage)!
        nameLabel.text = name
        aboutMeLabel.text = profile.about_me
        profileImageView.kf.setImage(with: url, placeholder: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showEditProfileSegue" {
            
            let dvc = segue.destination as! EditProfileTableViewController
            dvc.profile = profile
        }
    }
    
    @IBAction func editProfileTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "showEditProfileSegue", sender: self)
    }
}
