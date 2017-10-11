//
//  TimeTableFriday.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableFridayResponse: Decodable {
    
    let friday: [FacilitiesCenterDetailsTimeTable]?
    init?(json: JSON) {
//        guard let friday: [FacilitiesCenterDetailsTimeTable]  = "Friday" <~~ json else { return nil }
        
        self.friday = "Friday" <~~ json
    }
}
