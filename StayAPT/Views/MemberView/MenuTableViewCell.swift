//
//  MenuTableViewCell.swift
//  StayAPT
//
//  Created by Macintosh on 22/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var saImageView: UIImageView!
    @IBOutlet weak var saTitleLabel: UILabel!
    @IBOutlet weak var saSubTitleLabe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    var info: ClassModel? {
        didSet {
            if let member = info {
                didSetCategory(info: member)
            }
        }
    }
}

extension MenuTableViewCell {
    func didSetCategory(info: ClassModel) {
        let url = URL(string: info.img)!
        let image = UIImage(named: "gym")
        
        saImageView.kf.setImage(with: url, placeholder: image)
        saTitleLabel.text = info.className
        saSubTitleLabe.text = "Your Fitness Center"
    }
}
