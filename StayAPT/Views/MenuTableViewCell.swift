//
//  MenuTableViewCell.swift
//  StayAPT
//
//  Created by Macintosh on 22/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit


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
    
}
