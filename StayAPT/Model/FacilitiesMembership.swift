//
//  FacilitiesMembership.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FacilitiesMembership: Decodable {
    
    let price: String
    let features: [String]
    let offers: [String]
    
    init?(json: JSON) {
        guard let price: String = "price" <~~ json,
            let features: [String] = "features" <~~ json,
            let offers: [String] = "offers" <~~ json else { return nil }
        
        self.price = price
        self.features = features
        self.offers = offers
    }
}
