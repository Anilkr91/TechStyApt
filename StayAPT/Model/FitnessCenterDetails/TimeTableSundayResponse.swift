//
//  TimeTableSundayResponse.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct TimeTableSundayResponse: Gloss.Decodable {
    
    let sunday: [FacilitiesCenterDetailsTimeTable]?
    let monday: [FacilitiesCenterDetailsTimeTable]?
    let tuesday: [FacilitiesCenterDetailsTimeTable]?
    let wednesday: [FacilitiesCenterDetailsTimeTable]?
    let thursday: [FacilitiesCenterDetailsTimeTable]?
    let friday: [FacilitiesCenterDetailsTimeTable]?
    let saturday: [FacilitiesCenterDetailsTimeTable]?
    
    
    init?(json: JSON) {
        //        guard let sunday: [FacilitiesCenterDetailsTimeTable]  =  else { return nil }
        
        self.sunday = "Sunday" <~~ json
        self.monday = "Monday" <~~ json
        self.tuesday = "Tuesday" <~~ json
        self.wednesday = "Wednesday" <~~ json
        self.thursday = "Thursday" <~~ json
        self.friday = "Friday" <~~ json
        self.saturday = "Saturday" <~~ json
    }
}
