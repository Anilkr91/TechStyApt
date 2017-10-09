//
//  CircleImageView.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        clipsToBounds = true
        layer.cornerRadius = frame.size.width/2;
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.red.cgColor
    }
}
