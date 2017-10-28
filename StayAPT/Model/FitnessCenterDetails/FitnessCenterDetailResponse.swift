//
//  FitnessCenterDetailResponse.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct FitnessCenterDetailResponse: Gloss.Decodable {
    
    let information: FitnessCenterDetailInformationModel
    let classes: [FitnessCenterDetailClassModel]
    let facilities: [FitnessCenterDetailsFacilities]
    let trainers: [FacilitiesCenterDetailsTrainer]
    let membership: [FacilitiesCenterDetailsMembership]
    let timeTableSunday: [TimeTableSundayResponse]
    
    init?(json: JSON) {
        guard let information: FitnessCenterDetailInformationModel = "information" <~~ json,
            let classes: [FitnessCenterDetailClassModel] = "classes" <~~ json,
            let facilities: [FitnessCenterDetailsFacilities] = "facilities" <~~ json,
            let trainers: [FacilitiesCenterDetailsTrainer]  = "trainers" <~~ json,
            let membership: [FacilitiesCenterDetailsMembership]  = "membership" <~~ json,
            let timeTableSunday: [TimeTableSundayResponse] = "timetable" <~~ json else { return nil }
        
        self.information = information
        self.classes = classes
        self.facilities = facilities
        self.trainers = trainers
        self.membership = membership
        self.timeTableSunday = timeTableSunday
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "information" ~~> self.information,
            "classes" ~~> self.classes,
            "facilities" ~~> self.facilities,
            "trainers" ~~> self.trainers,
            "membership" ~~> self.membership,
            "timetable" ~~> self.timeTableSunday
            ])
    }
}
