//
//  FitnessCenterTimeTable.swift
//  StayAPT
//
//  Created by admin on 23/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class  FitnessCenterTimeTableCell: UITableViewCell {
    
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var book: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: FacilitiesCenterDetailsTimeTable? {
        didSet {
            if let member = info {
                didSetCategory(info: member)
            }
        }
    }
}

extension FitnessCenterTimeTableCell {
    func didSetCategory(info: FacilitiesCenterDetailsTimeTable) {
    
        classNameLabel.text = info.className
        timeLabel.text = info.start
    }
}
