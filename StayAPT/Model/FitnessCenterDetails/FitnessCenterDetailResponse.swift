//
//  FitnessCenterDetailResponse.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct FitnessCenterDetailResponse: Decodable {
    
    let information: FitnessCenterDetailInformationModel
    let classes: [FitnessCenterDetailClassModel]
    let facilities: [FitnessCenterDetailsFacilities]
    let trainers: [FacilitiesCenterDetailsTrainer]
    
    let membership: [FacilitiesCenterDetailsMembership]
//    let timeTable: [TimeTableSundayResponse]
    
    
        let timeTableSunday: [TimeTableSundayResponse]
//        let timeTableMonday: [TimeTableMondayResponse]
//        let timeTableTuesday: [TimeTableTuesdayResponse]
//        let timeTableWednesday: [TimeTableWednesdayResponse]
//        let timeTableThursday: [TimeTableThursdayResponse]
//        let timeTableFriday: [TimeTableFridayResponse]
//        let timeTableSaturday: [TimeTableSaturdayResponse]
    
    init?(json: JSON) {
        guard let information: FitnessCenterDetailInformationModel = "information" <~~ json,
            let classes: [FitnessCenterDetailClassModel] = "classes" <~~ json,
            let facilities: [FitnessCenterDetailsFacilities] = "facilities" <~~ json,
            let trainers: [FacilitiesCenterDetailsTrainer]  = "trainers" <~~ json,
            let membership: [FacilitiesCenterDetailsMembership]  = "membership" <~~ json,
//             let timeTable: [FacilitiesCenterDetailsTimeTable] = "timetable" <~~ json else { return nil }
        
                let timeTableSunday: [TimeTableSundayResponse] = "timetable" <~~ json else { return nil }
//                let timeTableMonday: [TimeTableMondayResponse] = "timetable" <~~ json,
//                let timeTableTuesday: [TimeTableTuesdayResponse] = "timetable" <~~ json,
//                let timeTableWednesday: [TimeTableWednesdayResponse] = "timetable" <~~ json,
//                let timeTableThursday: [TimeTableThursdayResponse] = "timetable" <~~ json,
//                let timeTableFriday: [TimeTableFridayResponse] = "timetable" <~~ json,
//                let timeTableSaturday: [TimeTableSaturdayResponse] = "timetable" <~~ json else { return nil }
        
        self.information = information
        self.classes = classes
        self.facilities = facilities
        self.trainers = trainers
        self.membership = membership
        self.timeTableSunday = timeTableSunday
//        self.timeTable = timeTable
    
        
        
//                self.timeTableMonday = timeTableMonday
//                self.timeTableTuesday = timeTableTuesday
//                self.timeTableWednesday = timeTableWednesday
//                self.timeTableThursday = timeTableThursday
//                self.timeTableFriday = timeTableFriday
//                self.timeTableSaturday = timeTableSaturday
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "information" ~~> self.information,
            "classes" ~~> self.classes,
            "facilities" ~~> self.facilities,
            "trainers" ~~> self.trainers,
            "membership" ~~> self.membership,
            "timetable" ~~> self.trainers
            ])
    }
}
