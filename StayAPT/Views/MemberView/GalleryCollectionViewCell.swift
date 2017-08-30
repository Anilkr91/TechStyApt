//
//  GalleryCollectionViewCell.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var instaImageView: UIImageView!
    @IBOutlet weak var gymNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var member: SACheckedInMember? {
        didSet {
            if let member = member {
                didSetCategory(member: member)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //setup()
    }
    
//    func setup() {
//        layer.cornerRadius = 10.0
//        layer.borderWidth = 1.0
//        layer.borderColor = UIColor.clear.cgColor
//        backgroundColor = UIColor.clear
//    }
    
    func didSetCategory(member: SACheckedInMember) {
        imageView.image = UIImage(imageLiteralResourceName: member.image)
        instaImageView.image = UIImage(imageLiteralResourceName: "insta-icon")
        gymNameLabel.text = member.name
        dateLabel.text = member.counter
    }
}
