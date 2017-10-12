//
//  GoalOfTheMonthStats.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class  GoalOfTheMonthStats: UITableViewCell {
    
    @IBOutlet weak var chestLabel: smallLabel!
    @IBOutlet weak var bicepsLabel: smallLabel!
    @IBOutlet weak var forearmLabel: smallLabel!
    @IBOutlet weak var wristLabel: smallLabel!
    @IBOutlet weak var shoulderLabel: smallLabel!
    @IBOutlet weak var WaistLabel: smallLabel!
    @IBOutlet weak var thighsLabel: smallLabel!
    @IBOutlet weak var calvesLabel: smallLabel!
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
        var info: GoalOfTheMonthStatsModel? {
            didSet {
                if let member = info {
                    didSetCategory(member)
                }
            }
        }
}

extension GoalOfTheMonthStats {
    func didSetCategory(_ info: GoalOfTheMonthStatsModel) {
        
//        editButton.addTarget(self, action: #selector(animation), for: .touchUpInside)

        chestLabel.text = info.chest
        bicepsLabel.text = info.biceps
        forearmLabel.text = info.forearm
        calvesLabel.text = info.calves
        wristLabel.text = info.wrist
        shoulderLabel.text =  info.shoulders
        WaistLabel.text = info.waist
        thighsLabel.text = info.thighs
        
    }
    
//    func animation(_ sender: UIButton) {
//        
//        print("edit clicked")
//    }
}
