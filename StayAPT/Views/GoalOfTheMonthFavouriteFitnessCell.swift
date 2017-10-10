//
//  GoalOfTheMonthFavouriteFitnessCell.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class GoalOfTheMonthFavouriteFitnessCell: UITableViewCell {
    
    @IBOutlet weak var favouriteFitnessImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: GoalOfTheMonthFavouriteFitnessCenter? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension GoalOfTheMonthFavouriteFitnessCell {
    func didSetCategory(_ info: GoalOfTheMonthFavouriteFitnessCenter) {
        let url = URL(string: info.logo)!
        let image = UIImage(named: "placeholder")
        
        favouriteFitnessImageView.kf.setImage(with: url, placeholder: image)
        nameLabel.text = info.fitness_center_name
        addressLabel.text = info.address
    }
}
