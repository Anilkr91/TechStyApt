//
//  FacilitiesModel.swift
//  StayAPT
//
//  Created by admin on 04/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FacilitiesModel: Decodable {
    
    let img: String
    
    init?(json: JSON) {
        guard let img: String = "logo" <~~ json else { return nil }
        self.img = img
    }
}
