//
//  FacebookButon.swift
//  StayAPT
//
//  Created by admin on 24/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FacebookButon: UIButton {
    
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
        layer.cornerRadius = 18
        backgroundColor = UIColor.blue
        
        let type = Device.userIntefaceType()
        if type == .pad {
            
            self.frame.size.height = 50.0
            self.titleLabel!.font =  UIFont(name: "cuyabra", size: CGFloat(Constants.ipad_baseFont))
        } else if type == .phone {
            
            self.frame.size.height = 30.0
            self.titleLabel!.font = UIFont(name: "cuyabra", size: CGFloat(Constants.iPhone_baseFont))
        }
    }
}
