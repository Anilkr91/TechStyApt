//
//  TimeTableMondayResponse.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableMondayResponse: Gloss.Decodable {
    
    let monday: [FacilitiesCenterDetailsTimeTable]?
    init?(json: JSON) {
//        guard let monday: [FacilitiesCenterDetailsTimeTable]  =  else { return nil }
        
        self.monday = "Monday" <~~ json
    }
}
