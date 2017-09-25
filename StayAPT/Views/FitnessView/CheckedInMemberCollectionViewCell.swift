//
//  CheckedInMemberCollectionViewCell.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class CheckedInMemberCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saNameLabel: UILabel!
    @IBOutlet weak var saCountLabel: UILabel!
    
    var member: SACheckedInMember? {
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
        layer.cornerRadius = 10.0
        layer.borderWidth = 1.0
        backgroundColor = UIColor.clear
    }
    
    func didSetCategory(_ member: SACheckedInMember) {
        imageView.image = UIImage(imageLiteralResourceName: member.image)
        saNameLabel.text = member.name
        saCountLabel.text = member.counter
    }
}
