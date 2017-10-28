//
//  VisitorsModel.swift
//  StayAPT
//
//  Created by admin on 05/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct VisitorsModel: Gloss.Decodable {
    
    let id: String
    let fcId: String
    let name: String
    let dob: String
    let date: String
    let mobile: String
    let email: String
    let reminder: String
    let notes: String
    let salesPersonId: String
    let visitStatus: String
    let salesPersonName: String
    let created_time: String
    
    init?(json: JSON) {
        guard let id: String = "id" <~~ json,
            let fcId: String = "fcID" <~~ json,
            let name: String = "v_name" <~~ json,
            let dob: String = "v_dob" <~~ json,
            let date: String = "v_date" <~~ json,
            let mobile: String = "v_mobile" <~~ json,
            let email: String = "V_emailID" <~~ json,
            let reminder: String = "v_reminder" <~~ json,
            let notes: String = "v_notes" <~~ json,
            let salesPersonId: String = "v_sales_person" <~~ json,
            let visitStatus: String = "statusVis" <~~ json,
            let salesPersonName: String = "s_name" <~~ json,
            let created_time: String = "created_time" <~~ json else { return nil }
        
        self.id = id
        self.fcId = fcId
        self.name = name
        self.dob = dob
        self.date = date
        self.mobile = mobile
        self.email = email
        self.reminder = reminder
        self.notes = notes
        self.salesPersonId = salesPersonId
        self.visitStatus = visitStatus
        self.salesPersonName = salesPersonName
        self.created_time = created_time
        
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "id" ~~> self.id,
            "fcID" ~~> self.fcId,
            "v_name" ~~> self.name,
            "v_dob" ~~> self.dob,
            "v_date" ~~> self.date,
            "v_mobile" ~~> self.mobile,
            "V_emailID" ~~> self.email,
            "v_reminder" ~~> self.reminder,
            "v_notes" ~~> self.notes,
            "v_sales_person" ~~> self.salesPersonId,
            "statusVis" ~~> self.visitStatus,
            "s_name" ~~> self.salesPersonName,
            "created_time" ~~> self.created_time
            ])
    }
}
