//
//  TimeTableWednesday.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableWednesdayResponse: Decodable {
    
    let wednesday: [FacilitiesCenterDetailsTimeTable]?
    init?(json: JSON) {
//        guard let wednesday: [FacilitiesCenterDetailsTimeTable]  = "Wednesday" <~~ json else { return nil }
        
        self.wednesday = "Wednesday" <~~ json
    }
}
