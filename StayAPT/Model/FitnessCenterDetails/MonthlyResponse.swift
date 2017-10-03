//
//  MonthlyResponse.swift
//  StayAPT
//
//  Created by admin on 30/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct MonthlyResponse: Decodable {
    
    let monthly: FacilitiesCenterDetailsMembership
    init?(json: JSON) {
        guard let monthly: FacilitiesCenterDetailsMembership  = "monthly" <~~ json else { return nil }

        self.monthly = monthly
    }
}
