//
//  GoalOfTheMonthCell.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import UIKit
import Kingfisher

class  GoalOfTheMonthCell: UITableViewCell {
    
    @IBOutlet weak var goalOfTheMonthImageView: UIImageView!
    @IBOutlet weak var goalOfTheMonthLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: String? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension GoalOfTheMonthCell {
    func didSetCategory(_ info: String) {
        editButton.addTarget(self, action: #selector(animation), for: .touchUpInside)
        goalOfTheMonthLabel.text = info
    }
    
    func animation(_ sender: UIButton) {
        print("edit clicked")
    }
}
