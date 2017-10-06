//
//  VisitorsFormModel.swift
//  StayAPT
//
//  Created by admin on 05/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct VisitorsFormModel {
    
    let fcId: String
    let name: String
    let dob: String
    let date: String
    let mobile: String
    let email: String
    let reminder: String
    let notes: String
    let salesPerson: String
    let visitStatus: String
    let fcName: String
    let fcEmail: String
    
    init(fcId: String, name: String, dob: String, date: String, mobile: String, email: String, reminder: String, notes: String, salesPerson: String, visitStatus: String, fcName: String, fcEmail: String) {
        
        self.fcId = fcId
        self.name = name
        self.dob = dob
        self.date = date
        self.mobile = mobile
        self.email = email
        self.reminder = reminder
        self.notes = notes
        self.salesPerson = salesPerson
        self.visitStatus = visitStatus
        self.fcName = fcName
        self.fcEmail = fcEmail
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "fcID" ~~> self.fcId,
            "v_name" ~~> self.name,
            "v_dob" ~~> self.dob,
            "v_date" ~~> self.date,
            "v_mobile" ~~> self.mobile,
            "V_emailID" ~~> self.email,
            "v_reminder" ~~> self.reminder,
            "v_notes" ~~> self.notes,
            "v_sales_person" ~~> self.salesPerson,
            "statusVis" ~~> self.visitStatus,
            "fitness_center_name" ~~> self.fcName,
            "fitness_center_email" ~~> self.fcEmail
            ])
    }
}
