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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
