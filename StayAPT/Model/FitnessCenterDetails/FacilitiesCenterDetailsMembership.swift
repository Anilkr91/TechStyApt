//
//  FacilitiesCenterDetails.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct FacilitiesCenterDetailsMembership: Decodable {
    
    let monthly: MonthlyResponse
    let quaterly: QuaterlyResponse
    let halfYearly: HalfYearlyResponse
    let yearly: YearlyResponse
    
    init?(json: JSON) {
        
        
        guard let monthly: MonthlyResponse = "monthly" <~~ json,
            let quaterly: QuaterlyResponse = "quaterly" <~~ json,
            let halfYearly: HalfYearlyResponse = "halfYearly" <~~ json,
            let yearly: YearlyResponse = "yearly" <~~ json else { return nil }
        
        self.monthly = monthly
        self.quaterly = quaterly
        self.halfYearly = halfYearly
        self.yearly = yearly
    }
}
