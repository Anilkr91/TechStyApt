//
//  TimeTableThursday.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableThursdayResponse: Decodable {
    
    let thursday: [FacilitiesCenterDetailsTimeTable]?
    init?(json: JSON) {
//        guard let thursday: [FacilitiesCenterDetailsTimeTable]  = "Thursday" <~~ json else { return nil }
        
        self.thursday = "Thursday" <~~ json
    }
}
