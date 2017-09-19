//
//  MediumLabel.swift
//  StayAPT
//
//  Created by admin on 11/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MediumLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let type = Device.userIntefaceType()
        if type == .pad {
            self.font = UIFont(name: "cuyabra", size: CGFloat(Constants.ipad_mediumFont))
        } else if type == .phone {
            self.font = UIFont(name: "cuyabra", size: CGFloat(Constants.iPhone_mediumFont))
        }
    }
}
