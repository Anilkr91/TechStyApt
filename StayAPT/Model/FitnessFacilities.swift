//
//  FitnessFacilities.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FitnessFacilities: Decodable {
    
    let fac_image: String
    let fac_name: String
    
    
    init?(json: JSON) {
        guard let fac_image: String = "fac_image" <~~ json,
            let fac_name: String = "fac_name" <~~ json else { return nil }
        
        self.fac_image = fac_image
        self.fac_name = fac_name
    }
}
