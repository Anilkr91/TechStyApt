//
//  MembersListCollectionViewCell.swift
//  StayAPT
//
//  Created by admin on 07/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import UIKit

class MembersListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saNameLabel: UILabel!
    
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
        layer.cornerRadius = 5.0
        layer.borderWidth = 0.3
        backgroundColor = UIColor.lightGray
    }
    
    func didSetCategory(member: SACheckedInMember) {
        imageView.image = UIImage(imageLiteralResourceName: member.image)
        saNameLabel.text = member.name
    }
}
