//
//  FitnessFacilitiesTableViewCell.swift
//  StayAPT
//
//  Created by admin on 03/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class FitnessFacilitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var facilitiesImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: FitnessCenterDetailsFacilities? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension FitnessFacilitiesTableViewCell {
    func didSetCategory(_ info: FitnessCenterDetailsFacilities) {
        let url = URL(string: info.fac_image)!
        let placeholderImage = UIImage(named: "placeholder")
        
        facilitiesImageView.kf.setImage(with: url, placeholder: placeholderImage)
        nameLabel.text = info.fac_name
    }
}
