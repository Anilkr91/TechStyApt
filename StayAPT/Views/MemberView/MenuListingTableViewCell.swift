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
            saAddGymButton.setBackgroundImage(heartfilled, for: .normal)
            addFitnessCenter(fcId: selectedCategory.id, userId: user.id)
            
        } else {
            isClicked = false
            saAddGymButton.setBackgroundImage(heart, for: .normal)
            removeFitnessCenter(fcId: selectedCategory.id, userId: user.id)
        }
    }
    
    func addFitnessCenter(fcId: String, userId: String ) {
        print(fcId)
        print(userId)
        
        let param = ["fcID": "1", "userId": "1"]
        AddFitnessCenterPostService.executeRequest(params: param as [String : AnyObject]) { (data) in
            print(data)
        }
    }
    
    func removeFitnessCenter(fcId: String, userId: String) {
        print(fcId)
        print(userId)
        
        //let param = ["fcID": "1", "userId": "1"]
        //        AddFitnessCenterPostService.executeRequest(params: param as [String : AnyObject]) { (<#SuccessModel#>) in
        //            <#code#>
        //        }
    }
}
