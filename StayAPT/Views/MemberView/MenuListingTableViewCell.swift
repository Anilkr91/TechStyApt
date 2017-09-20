//
//  MenuListingTableViewCell.swift
//  StayAPT
//
//  Created by admin on 23/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MenuListingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var saGymImageView: UIImageView!
    @IBOutlet weak var saGymTitleLabel: UILabel!
    @IBOutlet weak var saGymSubTitleLabe: UILabel!
    @IBOutlet weak var saAddGymButton: UIButton!
    var selectedCategory: FitnessCenterModel!
    var isClicked: Bool = false
    
    let user = LoginUtils.getCurrentMemberUserLogin()!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: FitnessCenterModel? {
        didSet {
            if let member = info {
                didSetCategory(info: member)
            }
        }
    }
}

extension MenuListingTableViewCell {
    func didSetCategory(info: FitnessCenterModel) {
        let url = URL(string: info.img)!
        let image = UIImage(named: "gym")
        let heart = UIImage(named: "heart")
        
        saAddGymButton.setBackgroundImage(heart, for: .normal)
        saAddGymButton.contentMode = .scaleAspectFit
        
        saGymImageView.kf.setImage(with: url, placeholder: image)
        saGymTitleLabel.text = info.name
        saGymSubTitleLabe.text = info.address
        
        selectedCategory = info
        saAddGymButton.addTarget(self, action: #selector(animation), for: .touchUpInside)
    }
    
    func animation() {
        
        let heart = UIImage(named: "heart")
        let heartfilled = UIImage(named: "heart-Filled")
        
        if !isClicked {
            isClicked = true
            addFitnessCenter(fcId: selectedCategory.id, userId: user.id, heart: heart!, heartfilled: heartfilled!)
            
        } else {
            isClicked = false
            removeFitnessCenter(fcId: selectedCategory.id, userId: user.id, heart: heart!, heartfilled: heartfilled!)
        }
    }
    
    func addFitnessCenter(fcId: String, userId: String, heart: UIImage, heartfilled: UIImage ) {
        let param = ["fcID": fcId, "userId": userId]
        AddFitnessCenterPostService.executeRequest(params: param as [String : AnyObject]) { (data) in
            self.saAddGymButton.setBackgroundImage(heartfilled, for: .normal)
            Alert.showAlertWithMessage(title: "Success", message: data.response!)
        }
    }
    
    func removeFitnessCenter(fcId: String, userId: String, heart: UIImage, heartfilled: UIImage) {
         let param = ["fcID": fcId, "userId": userId]
        AddFitnessCenterPostService.executeRequest(params: param as [String : AnyObject]) { (data) in
            self.saAddGymButton.setBackgroundImage(heart, for: .normal)
            Alert.showAlertWithMessage(title: "Success", message: data.response!)
        }
    }
}
