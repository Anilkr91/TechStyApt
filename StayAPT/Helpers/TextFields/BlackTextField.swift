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
        
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        borderLine.backgroundColor = UIColor.black
        self.addSubview(borderLine)
    }
}
