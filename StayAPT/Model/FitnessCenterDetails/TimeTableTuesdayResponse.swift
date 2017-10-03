//
//  TimeTableTuesday.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableTuesdayResponse: Decodable {
    
    let tuesday: [FacilitiesCenterDetailsTimeTable]
    init?(json: JSON) {
        guard let tuesday: [FacilitiesCenterDetailsTimeTable]  = "Tuesday" <~~ json else { return nil }
        
        self.tuesday = tuesday
    }
}
