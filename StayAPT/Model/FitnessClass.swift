//
//  FitnessClass.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FitnessClass: Decodable {
    
    let classImage: String
    let className: String
    
    
    init?(json: JSON) {
        guard let classImage: String = "classImage" <~~ json,
            let className: String = "className" <~~ json else { return nil }
        
        self.classImage = classImage
        self.className = className
    }
}
