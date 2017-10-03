//
//  FitnessClassesCollectionViewCell.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessClassesCollectionViewCell: UICollectionViewCell {
  
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var member: FitnessCenterDetailClassModel? {
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
    
    func didSetCategory(_ member: FitnessCenterDetailClassModel) {
        
        let url = URL(string: member.classImage)!
        let image = UIImage(named: "gym")
        
        imageView.kf.setImage(with: url, placeholder: image)
        //imageView.image = UIImage(imageLiteralResourceName: member.image)
//        imageView.image = UIImage(imageLiteralResourceName: "insta-icon")
        label.text = member.className
//        dateLabel.text = member.counter
    }
}
