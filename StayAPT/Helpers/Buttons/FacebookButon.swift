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
    }

}
