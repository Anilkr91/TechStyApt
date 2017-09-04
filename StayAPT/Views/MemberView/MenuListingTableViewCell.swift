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
    var isClicked: Bool = false

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
        
        saAddGymButton.addTarget(self, action: #selector(animation(sender:)), for: .touchUpInside)
    }
    
    func animation(sender: UIButton) {
        
        let heart = UIImage(named: "heart")
        let heartfilled = UIImage(named: "heart-Filled")
        
        if !isClicked {
            isClicked = true
            saAddGymButton.setBackgroundImage(heartfilled, for: .normal)
          
        } else {
            isClicked = false
            saAddGymButton.setBackgroundImage(heart, for: .normal)
           
        }
    }
}
