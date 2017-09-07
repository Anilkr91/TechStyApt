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
        roundedLabel()
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
    
    func roundedLabel() {
        mealDescription.alpha = 0.0
        mealDescription.layer.cornerRadius = 8.0
        mealDescription.clipsToBounds = true
    }
}

extension DietPlanTableViewCell {
    func didSetCategory(info: DietPlanModel) {
        mealButton.addTarget(self, action: #selector(animation(sender:)), for: .touchUpInside)
        mealButton.setTitle(info.mealName, for:.normal)
        mealDescription.text = info.description
    }
    
    
    func animation(sender: UIButton) {
        
        if !isClicked {
            isClicked = true
            
            // move button to left
            moveLeftAnimation()
            //flip()
        } else {
            isClicked = false
            
            // move button to center
            moveToCenter()
        }
    }
    
    
    func moveLeftAnimation() {
        UIView.animate(withDuration: 1) {
            self.mealButton.frame.origin.x = self.contentView.frame.origin.x + 8
            self.fadeOutAnimation()
        }
    }
    
    func moveToCenter() {
        UIView.animate(withDuration: 1) {
            self.mealButton.center = self.contentView.center
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
    
    
//    
//    func flip() {
//        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
//        
//        UIView.transition(with: mealDescription, duration: 1.0, options: transitionOptions, animations: {
//            self.mealButton.isHidden = true
//        })
//        
//        UIView.transition(with: mealButton, duration: 1.0, options: transitionOptions, animations: {
//            self.mealDescription.isHidden = false
//        })
//    }
}
