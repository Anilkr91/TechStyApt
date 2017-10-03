//
//  TimeTableSaturday.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableSaturdayResponse: Decodable {
    
    let saturday: [FacilitiesCenterDetailsTimeTable]
    init?(json: JSON) {
        guard let saturday: [FacilitiesCenterDetailsTimeTable]  = "Saturday" <~~ json else { return nil }
        
        self.saturday = saturday
    }
}
