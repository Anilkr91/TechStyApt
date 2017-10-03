//
//  YearlyResponse.swift
//  StayAPT
//
//  Created by admin on 30/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct YearlyResponse: Decodable {
    
    let quaterly: FacilitiesCenterDetailsMembership
    init?(json: JSON) {
        guard let quaterly: FacilitiesCenterDetailsMembership  = "yearly" <~~ json else { return nil }
        
        self.quaterly = quaterly
    }
}
