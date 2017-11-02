//
//  FCLoginResponse.swift
//  StayAPT
//
//  Created by admin on 14/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FCLoginResponse: Gloss.Decodable {
    
    let address: String
    let author_name: String
    let empID: String
    let fcId: String
    let fitness_center_name: String
    let fitness_email: String
    let id: String
    let is_login: String
    let logoImage: String
    let phone_number: String
    let roleID: String
    let status: String
    let stayAptId: String
    
    init?(json: JSON) {
        
        print(json)
        
        guard let address: String = "fitness_login_session.address" <~~ json,
            let author_name: String = "fitness_login_session.author_name" <~~ json,
            let empID: String = "fitness_login_session.empID" <~~ json,
            let fcId: String = "fitness_login_session.fcId" <~~ json,
            let fitness_center_name: String = "fitness_login_session.fitness_center_name" <~~ json,
            let fitness_email: String = "fitness_login_session.fitness_email" <~~ json,
            let id: String = "fitness_login_session.id" <~~ json,
            let is_login: String = "fitness_login_session.is_login" <~~ json,
            let logoImage: String = "fitness_login_session.logoImage" <~~ json,
            let phone_number: String = "fitness_login_session.phone_number" <~~ json,
            let roleID: String = "fitness_login_session.roleID" <~~ json,
            let status: String = "fitness_login_session.status" <~~ json,
            let stayAptId: String = "fitness_login_session.userName" <~~ json else { return nil }
        
        self.id = id
        self.is_login = is_login
        self.roleID = roleID
        self.empID = empID
        self.stayAptId = stayAptId
        self.logoImage = logoImage
        self.fitness_center_name = fitness_center_name
        self.fitness_email = fitness_email
        self.phone_number = phone_number
        self.address = address
        self.author_name = author_name
        self.status = status
        self.fcId = fcId
        
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "fitness_login_session.address" ~~> self.address,
            "fitness_login_session.author_name" ~~> self.author_name,
            "fitness_login_session.empID" ~~> self.empID,
            "fitness_login_session.fcId" ~~> self.fcId,
            "fitness_login_session.fitness_center_name" ~~> self.fitness_center_name,
            "fitness_login_session.fitness_email" ~~> self.fitness_email,
            "fitness_login_session.id" ~~> self.id,
            "fitness_login_session.is_login" ~~> self.is_login,
            "fitness_login_session.logoImage" ~~> self.logoImage,
            "fitness_login_session.phone_number" ~~> self.phone_number,
            "fitness_login_session.roleID" ~~> self.roleID,
            "fitness_login_session.status" ~~> self.status,
            "fitness_login_session.userName" ~~> self.stayAptId
            ])
    }
}
