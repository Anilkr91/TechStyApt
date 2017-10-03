//
//  TimeTableSundayResponse.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableSundayResponse: Decodable {
    
    let sunday: [FacilitiesCenterDetailsTimeTable]
    init?(json: JSON) {
        guard let sunday: [FacilitiesCenterDetailsTimeTable]  = "Sunday" <~~ json else { return nil }
        
        self.sunday = sunday
    }
}
