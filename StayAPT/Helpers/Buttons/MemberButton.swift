//
//  MemberButton.swift
//  StayAPT
//
//  Created by admin on 11/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MemberButton: UIButton {
    
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
        backgroundColor = UIColor.white
        
        let type = Device.userIntefaceType()
        if type == .pad {
            layer.cornerRadius = 18
            self.frame.size.height = 50.0
            self.titleLabel!.font =  UIFont(name: "cuyabra", size: CGFloat(Constants.ipad_baseFont))
        } else if type == .phone {
            layer.cornerRadius = 13
            self.frame.size.height = 30.0
            self.titleLabel!.font =  UIFont(name: "cuyabra", size: CGFloat(Constants.iPhone_baseFont))
        }
    }
}
