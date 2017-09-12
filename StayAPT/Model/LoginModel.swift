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
    
    init( email: String, password: String, userType: Int) {
        self.email = email
        self.password = password
        self.userType = userType
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "email" ~~> self.email,
            "password" ~~> self.password,
            "userType" ~~> self.userType
            ])
    }
}
