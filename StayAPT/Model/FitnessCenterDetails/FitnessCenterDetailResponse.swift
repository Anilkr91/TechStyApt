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
    
    let membershipMonthly: MonthlyResponse
    let membershipQuaterly: QuaterlyResponse
    let membershiphalfYearly: HalfYearlyResponse
    let membershipYearly: YearlyResponse
    
    
    let timeTableSunday: TimeTableSundayResponse
    let timeTableMonday: TimeTableMondayResponse
    let timeTableTuesday: TimeTableTuesdayResponse
    let timeTableWednesday: TimeTableWednesdayResponse
    let timeTableThursday: TimeTableThursdayResponse
    let timeTableFriday: TimeTableFridayResponse
    let timeTableSaturday: TimeTableSaturdayResponse
    
    
    
    init?(json: JSON) {
        guard let information: FitnessCenterDetailInformationModel = "information" <~~ json,
        let classes: [FitnessCenterDetailClassModel] = "classes" <~~ json,
        let facilities: [FitnessCenterDetailsFacilities] = "facilities" <~~ json,
        let trainers: [FacilitiesCenterDetailsTrainer]  = "trainers" <~~ json,
        let membershipMonthly: MonthlyResponse  = "membership" <~~ json,
        let membershipQuaterly: QuaterlyResponse  = "membership" <~~ json,
        let membershiphalfYearly: HalfYearlyResponse  = "membership" <~~ json,
        let membershipYearly: YearlyResponse  = "membership" <~~ json,
        let timeTableSunday: TimeTableSundayResponse = "timetable" <~~ json,
        let timeTableMonday: TimeTableMondayResponse = "timetable" <~~ json,
        let timeTableTuesday: TimeTableTuesdayResponse = "timetable" <~~ json,
        let timeTableWednesday: TimeTableWednesdayResponse = "timetable" <~~ json,
        let timeTableThursday: TimeTableThursdayResponse = "timetable" <~~ json,
        let timeTableFriday: TimeTableFridayResponse = "timetable" <~~ json,
        let timeTableSaturday: TimeTableSaturdayResponse = "timetable" <~~ json else { return nil }
        
        self.information = information
        self.classes = classes
        self.facilities = facilities
        self.trainers = trainers
        self.membershipMonthly = membershipMonthly
        self.membershipQuaterly = membershipQuaterly
        self.membershiphalfYearly = membershiphalfYearly
        self.membershipYearly = membershipYearly
        
        self.timeTableSunday = timeTableSunday
        self.timeTableMonday = timeTableMonday
        self.timeTableTuesday = timeTableTuesday
        self.timeTableWednesday = timeTableWednesday
        self.timeTableThursday = timeTableThursday
        self.timeTableFriday = timeTableFriday
        self.timeTableSaturday = timeTableSaturday
    }
}
