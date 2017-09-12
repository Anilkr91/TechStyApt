//
//  LoginModelResponse.swift
//  StayAPT
//
//  Created by admin on 12/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct LoginModelResponse: Decodable {
    
    let account_type: String
    let address: String?
    let anniversary: String
    let birthday: String
    let email_id: String
    let emergency_no: String
    let gender: String
    let id: String
    let is_verified: String
    let mobile_no: String
    let name: String
    let password: String
    let stayAptID: String?
    let title: String?
    let user_photo: String?
    let verifiedCode: String?
    
    init?(json: JSON) {
        guard let account_type: String = "user_login_session.account_type" <~~ json,
//            let address: String = "address" <~~ json,
            let anniversary: String = "user_login_session.anniversary" <~~ json,
            let birthday: String = "user_login_session.birthday" <~~ json,
            let email_id: String = "user_login_session.email_id" <~~ json,
            let emergency_no: String = "user_login_session.emergency_no" <~~ json,
            let gender: String = "user_login_session.gender" <~~ json,
            let id: String = "user_login_session.id" <~~ json,
            let is_verified: String = "user_login_session.is_verified" <~~ json,
            let mobile_no: String = "user_login_session.mobile_no" <~~ json,
            let name: String = "user_login_session.name" <~~ json,
            let password: String = "user_login_session.password" <~~ json
//            let stayAptID: String = "stayAptID" <~~ json,
//            let title: String = "title" <~~ json,
//            let user_photo: String = "user_photo" <~~ json,
//            let verifiedCode: String = "verifiedCode" <~~ json
        
            else { return nil }
        
        self.account_type = account_type
        self.address = "user_login_session.address" <~~ json
        self.anniversary = anniversary
        self.birthday = birthday
        self.email_id = email_id
        self.emergency_no = emergency_no
        self.gender = gender
        self.id = id
        self.is_verified = is_verified
        self.mobile_no = mobile_no
        self.name = name
        self.password = password
        self.stayAptID = "user_login_session.stayAptID" <~~ json
        self.title = "user_login_session.title" <~~ json
        self.user_photo = "user_login_session.user_photo" <~~ json
        self.verifiedCode = "user_login_session.verifiedCode" <~~ json
        
        
    }
}
