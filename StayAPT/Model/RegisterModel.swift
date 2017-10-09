//
//  RegisterModel.swift
//  StayAPT
//
//  Created by admin on 12/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct RegisterModel {
    
    let name: String
    let email: String
    let password: String
    let userType: Int
    
    init(name: String, email: String, password: String, userType: Int) {
        self.name = name
        self.email = email
        self.password = password
        self.userType = userType
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "email" ~~> self.email,
            "password" ~~> self.password,
            "userType" ~~> self.userType
            ])
    }
}
