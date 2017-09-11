//
//  RedButton.swift
//  StayAPT
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class RedButton: UIButton {
    
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
        layer.cornerRadius = 8
        backgroundColor = UIColor.red
        let type = Device.userIntefaceType()
        if type == .pad {
            self.frame.size.height = 45.0
        } else if type == .phone {
            self.frame.size.height = 30.0
        }
    }
}
