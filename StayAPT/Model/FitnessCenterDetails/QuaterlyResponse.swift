//
//  QuaterlyResponse.swift
//  StayAPT
//
//  Created by admin on 30/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct QuaterlyResponse: Decodable {
    
    let quaterly: FacilitiesCenterDetailsMembership
    init?(json: JSON) {
        guard let quaterly: FacilitiesCenterDetailsMembership  = "quaterly" <~~ json else { return nil }
        
        self.quaterly = quaterly
    }
}
