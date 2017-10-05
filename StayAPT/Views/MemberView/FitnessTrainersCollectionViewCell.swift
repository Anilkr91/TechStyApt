//
//  FitnessTrainersCollectionViewCell.swift
//  StayAPT
//
//  Created by admin on 04/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class FitnessTrainersCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var trainersImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var member: FacilitiesCenterDetailsTrainer? {
        didSet {
            if let member = member {
                didSetCategory(member)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.clear
    }
    
    func didSetCategory(_ member: FacilitiesCenterDetailsTrainer) {
        
        let url = URL(string: member.trainerImage)!
        let image = UIImage(named: "gym")
        
        trainersImageView.kf.setImage(with: url, placeholder: image)
        //imageView.image = UIImage(imageLiteralResourceName: member.image)
        //        imageView.image = UIImage(imageLiteralResourceName: "insta-icon")
        nameLabel.text = member.trainerName
        //        dateLabel.text = member.counter
    }
}
