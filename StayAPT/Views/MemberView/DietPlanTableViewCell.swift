//
//  DietPlanTableViewCell.swift
//  StayAPT
//
//  Created by admin on 31/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class DietPlanTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var mealDescription: UILabel!
    var isClicked: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: DietPlanModel? {
        didSet {
            if let member = info {
                didSetCategory(info: member)
            }
        }
    }
}

extension DietPlanTableViewCell {
    func didSetCategory(info: DietPlanModel) {
        mealButton.addTarget(self, action: #selector(animation(sender:)), for: .touchUpInside)
        mealDescription.alpha = 0.0
        mealButton.setTitle(info.mealName, for:.normal)
        mealDescription.text = info.description
    }
    
    
    func animation(sender: UIButton) {
        
        if !isClicked {
            isClicked = true
            
            // move button to left
            moveLeftAnimation()
        } else {
            isClicked = false
            
            // move button to center
            moveToCenter()
            print("clicked second")
        }
    }
    
    
    func moveLeftAnimation() {
        UIView.animate(withDuration: 1) {
            self.mealButton.frame.origin.x = self.mealButton.frame.origin.x - self.mealButton.frame.size.width - 95
            self.mealButton.isSelected = true
            self.fadeOutAnimation()
        }
    }
    
    func moveToCenter() {
        UIView.animate(withDuration: 1) {
            self.mealButton.frame.origin.x = self.mealButton.frame.origin.x + 130
            self.mealButton.isSelected = true
            self.fadeInAnimation()
        }
    }
    
    func fadeOutAnimation() {
        UIView.animate(withDuration: 2.0, animations: {
            self.mealDescription.alpha = 1.0
        })
    }
    
    func fadeInAnimation() {
        
        UIView.animate(withDuration: 2.0, animations: {
            self.mealDescription.alpha = 0.0
        })
    }
}
