//
//  FCLoginResponse.swift
//  StayAPT
//
//  Created by admin on 14/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FCLoginResponse: Decodable {
    let id: String
    let datetime: String
    let ip_address: String
    let empID: String
    let stayAptId: String
    let logoImage: String
    let fitness_center_name: String
    let fitness_email: String
    let password: String
    let phone_number: String
    let address: String
    let loc_id: String
    let sub_loc_id: String
    let alternate_number: String
    let pincode: String
    let author_name: String
    let owner: String
    let information: String
    let status: String
    let is_display: String
    
    init?(json: JSON) {
        guard let id: String = "fitness_login_session.id" <~~ json,
            let datetime: String = "fitness_login_session.datetime" <~~ json,
            let ip_address: String = "fitness_login_session.ip_address" <~~ json,
            let empID: String = "fitness_login_session.empID" <~~ json,
            let stayAptId: String = "fitness_login_session.userName" <~~ json,
            let logoImage: String = "fitness_login_session.logoImage" <~~ json,
            let fitness_center_name: String = "fitness_login_session.fitness_center_name" <~~ json,
            let fitness_email: String = "fitness_login_session.fitness_email" <~~ json,
            let password: String = "fitness_login_session.password" <~~ json,
            let phone_number: String = "fitness_login_session.phone_number" <~~ json,
            let address: String = "fitness_login_session.address" <~~ json,
            let loc_id: String = "fitness_login_session.loc_id" <~~ json,
            let sub_loc_id: String = "fitness_login_session.sub_loc_id" <~~ json,
            let alternate_number: String = "fitness_login_session.alternate_number" <~~ json,
            let pincode: String = "fitness_login_session.pincode" <~~ json,
            let author_name: String = "fitness_login_session.author_name" <~~ json,
            let owner: String = "fitness_login_session.owner" <~~ json,
            let information: String = "fitness_login_session.information" <~~ json,
            let status: String = "fitness_login_session.status" <~~ json,
            let is_display: String = "fitness_login_session.is_display" <~~ json else { return nil }
        
        self.id = id
        self.datetime = datetime
        self.ip_address = ip_address
        self.empID = empID
        self.stayAptId = stayAptId
        self.logoImage = logoImage
        self.fitness_center_name = fitness_center_name
        self.fitness_email = fitness_email
        self.password = password
        self.phone_number = phone_number
        self.address = address
        self.loc_id = loc_id
        self.sub_loc_id = sub_loc_id
        self.alternate_number = alternate_number
        self.pincode = pincode
        self.author_name = author_name
        self.owner = owner
        self.information = information
        self.status = status
        self.is_display = is_display
    }
}
