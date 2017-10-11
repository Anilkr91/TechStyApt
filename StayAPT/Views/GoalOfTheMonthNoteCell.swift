//
//  GoalOfTheMonthNoteCell.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class  GoalOfTheMonthNoteCell: UITableViewCell {
    
    @IBOutlet weak var notesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
        var info: GoalOfTheMonthModel? {
            didSet {
                if let member = info {
                    didSetCategory(member)
                }
            }
        }
}

extension GoalOfTheMonthNoteCell {
    func didSetCategory(_ info: GoalOfTheMonthModel) {
        
        print(info)
        //        let url = URL(string: info)!
        //        let placeholderImage = UIImage(named: "placeholder")

        //        membershipImageView.kf.setImage(with: url, placeholder: placeholderImage)
//        priceLabel.text = info.price
//        discountLabel.text = info.offers.first
    }
}
