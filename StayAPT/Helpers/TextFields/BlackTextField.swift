//
//  BlackTextField.swift
//  StayAPT
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class BlackTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setBottomLine()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setBottomLine()
    }
    
    func setup() {
        backgroundColor = UIColor.clear
    }
    
    func setBottomLine() {
        //self.borderStyle = UITextBorderStyle.none
        let type = Device.userIntefaceType()
        if type == .pad {
           self.font = UIFont(name: "cuyabra", size: CGFloat(Constants.ipad_baseFont))
        } else if type == .phone {
           self.font = UIFont(name: "cuyabra", size: CGFloat(Constants.iPhone_mediumFont))
        }
        
        self.backgroundColor = UIColor.clear
        let borderLine = UIView()
        let height = 0.5
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        borderLine.backgroundColor = UIColor.black
        self.addSubview(borderLine)
    }
}
