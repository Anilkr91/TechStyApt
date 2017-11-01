//
//  LoginModel.swift
//  StayAPT
//
//  Created by admin on 12/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct LoginModel {

    let email: String
    let password: String
    let userType: Int
    let fcType: Int
    let stayAptId: String
    
    init( email: String, password: String, userType: Int, fcType: Int, stayAptId: String) {
        self.email = email
        self.password = password
        self.userType = userType
        self.fcType = fcType
        self.stayAptId = stayAptId
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "email" ~~> self.email,
            "password" ~~> self.password,
            "userType" ~~> self.userType,
            "fcType" ~~> self.fcType,
            "Username" ~~> self.stayAptId
            ])
    }
}
