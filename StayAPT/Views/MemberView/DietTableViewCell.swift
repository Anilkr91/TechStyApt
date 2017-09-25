//
//  DietTableViewCell.swift
//  StayAPT
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class DietTableViewCell: UITableViewCell {
    
    @IBOutlet weak var saImageView: UIImageView!
    @IBOutlet weak var saTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var info: SACheckedInMember? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension DietTableViewCell {
    func didSetCategory(_ info: SACheckedInMember) {
       // let url = URL(string: info.image)!
       // let image = UIImage(named: "gym")
        //saImageView.kf.setImage(with: url, placeholder: image)
        
        saImageView.image = UIImage(imageLiteralResourceName: info.image)
        saTitleLabel.text = info.name
        //saSubTitleLabe.text = "Your Fitness Center"
    }
}
