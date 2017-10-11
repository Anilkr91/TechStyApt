//
//  GoalOfTheMonthMyWorkOutCell.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class  GoalOfTheMonthMyWorkOutCell: UITableViewCell {
    
    @IBOutlet weak var membershipImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: GoalOfTheMonthWorkOut? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension GoalOfTheMonthMyWorkOutCell {
    func didSetCategory(_ info: GoalOfTheMonthWorkOut) {
        
        print(info)
        //        let url = URL(string: info)!
        //        let placeholderImage = UIImage(named: "placeholder")
        
        //        membershipImageView.kf.setImage(with: url, placeholder: placeholderImage)
//        priceLabel.text = info.price
//        discountLabel.text = info.offers.first
    }
}