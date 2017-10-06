//
//  FitnessCenterDetailCollectionCell.swift
//  StayAPT
//
//  Created by admin on 06/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import YBSlantedCollectionViewLayout

//let yOffsetSpeed: CGFloat = 150.0
//let xOffsetSpeed: CGFloat = 100.0

class FitnessCenterDetailCollectionCell: YBSlantedCollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var member: String? {
        didSet {
            if let member = member {
                didSetCategory(member)
            }
        }
    }
    
    var imageHeight: CGFloat {
        return (imageView?.image?.size.height) ?? 0.0
    }
    
    var imageWidth: CGFloat {
        return (imageView?.image?.size.width) ?? 0.0
    }
    
    func offset(_ offset: CGPoint) {
        imageView.frame = self.imageView.bounds.offsetBy(dx: offset.x, dy: offset.y)
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
    
    func didSetCategory(_ member: String) {
        
        print(member)
        
        //        let url = URL(string: member.image)!
//                let image = UIImage(named: "gym")
        
        //imageView.kf.setImage(with: url, placeholder: image)
//        imageView.image = UIImage(imageLiteralResourceName: member.image)
        imageView.image = UIImage(named: "gym")
        titleLabel.text = member
    }
}
