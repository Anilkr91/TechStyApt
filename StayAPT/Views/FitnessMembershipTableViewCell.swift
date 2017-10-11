//
//  FitnessMembershipTableViewCell.swift
//  StayAPT
//
//  Created by admin on 04/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class FitnessMembershipTableViewCell: UITableViewCell {
    
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
    
    var info: MembershipModel? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension FitnessMembershipTableViewCell {
    func didSetCategory(_ info: MembershipModel) {
//        let url = URL(string: info.)!
//        let placeholderImage = UIImage(named: "placeholder")
//        
//        membershipImageView.kf.setImage(with: url, placeholder: placeholderImage)
        priceLabel.text = info.monthlyPrice
        discountLabel.text = info.featuresMonthly.first
    }
}
