//
//  GoalOfTheMonthStats.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class  GoalOfTheMonthStats: UITableViewCell {
    
    @IBOutlet weak var chestLabel: smallLabel!
    @IBOutlet weak var bicepsLabel: smallLabel!
    @IBOutlet weak var forearmLabel: smallLabel!
    @IBOutlet weak var wristLabel: smallLabel!
    
    @IBOutlet weak var shoulderLabel: smallLabel!
    @IBOutlet weak var WaistLabel: smallLabel!
    @IBOutlet weak var thighsLabel: smallLabel!
    @IBOutlet weak var calvesLabel: smallLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
        var info: GoalOfTheMonthStatsModel? {
            didSet {
                if let member = info {
                    didSetCategory(member)
                }
            }
        }
}

extension GoalOfTheMonthStats {
    func didSetCategory(_ info: GoalOfTheMonthStatsModel) {
        
        print(info)
        //        let url = URL(string: info)!
        //        let placeholderImage = UIImage(named: "placeholder")

        //        membershipImageView.kf.setImage(with: url, placeholder: placeholderImage)
//        priceLabel.text = info.price
//        discountLabel.text = info.offers.first
    }
}
