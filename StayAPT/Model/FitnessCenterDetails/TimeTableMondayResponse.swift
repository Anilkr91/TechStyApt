//
//  TimeTableMondayResponse.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableMondayResponse: Decodable {
    
    let monday: [FacilitiesCenterDetailsTimeTable]
    init?(json: JSON) {
        guard let monday: [FacilitiesCenterDetailsTimeTable]  = "Monday" <~~ json else { return nil }
        
        self.monday = monday
    }
}
