//
//  MembershipModel.swift
//  StayAPT
//
//  Created by admin on 10/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct MembershipModel {
    
    let monthlyPrice: String
    let membershipPlanMonthly: String
    let featuresMonthly: [String]
    let offersMonthly: String

    init(monthlyPrice: String, membershipPlanMonthly: String, featuresMonthly: [String],offersMonthly: String  ) {
        
        self.monthlyPrice = monthlyPrice
        self.membershipPlanMonthly = membershipPlanMonthly
        self.featuresMonthly = featuresMonthly
        self.offersMonthly = offersMonthly

    }
}
