//
//  EmployeeListTableViewCell.swift
//  StayAPT
//
//  Created by admin on 02/11/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var nameLabel: smallLabel!
    
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

extension EmployeeListTableViewCell {
    func didSetCategory(_ info: String) {
        
//        goalOfTheMonthLabel.text = info
    }
}
