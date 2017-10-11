//
//  HalfYearly.swift
//  StayAPT
//
//  Created by admin on 30/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct HalfYearlyResponse: Decodable {
    
    let monthlyPrice: String?
    let membershipPlanMonthly: String?
    let featuresMonthly: [String]?
    let offersMonthly: String?
       
    init?(json: JSON) {
        
        self.monthlyPrice = "price" <~~ json
        self.membershipPlanMonthly = "membershipPlan" <~~ json
        self.featuresMonthly = "features" <~~ json
        self.offersMonthly = "offers" <~~ json
    }
}
