//
//  ClassModel.swift
//  StayAPT
//
//  Created by admin on 29/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct ClassModel: Gloss.Decodable {
    
    let id: String
    let className: String
    let img: String
        
    init?(json: JSON) {
        guard let id: String = "id" <~~ json,
            let className: String = "className" <~~ json,
            let img: String = "img" <~~ json else { return nil }
        
        self.id = id
        self.className = className
        self.img = img
    }
}
