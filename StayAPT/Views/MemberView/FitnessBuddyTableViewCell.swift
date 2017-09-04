//
//  FitnessBuddyTableViewCell.swift
//  StayAPT
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessBuddyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var saImageView: UIImageView!
    @IBOutlet weak var saNameLabel: UILabel!
    @IBOutlet weak var saDetailLabel: UILabel!
    
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
                didSetCategory(info: member)
            }
        }
    }
}

extension FitnessBuddyTableViewCell {
    func didSetCategory(info: SACheckedInMember) {
        // let url = URL(string: info.image)!
        // let image = UIImage(named: "gym")
        //saImageView.kf.setImage(with: url, placeholder: image)
        
        saImageView.image = UIImage(imageLiteralResourceName: info.image)
        saNameLabel.text = info.name
        saDetailLabel.text = "Your Fitness Center"
    }
}
