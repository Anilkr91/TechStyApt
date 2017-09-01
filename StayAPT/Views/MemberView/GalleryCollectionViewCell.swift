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
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.clear
    }
    
    func didSetCategory(member: SACheckedInMember) {
        
        let url = URL(string: member.image)!
        let image = UIImage(named: "gym")
        
        imageView.kf.setImage(with: url, placeholder: image)
        //imageView.image = UIImage(imageLiteralResourceName: member.image)
        instaImageView.image = UIImage(imageLiteralResourceName: "insta-icon")
        gymNameLabel.text = member.name
        dateLabel.text = member.counter
    }
}
