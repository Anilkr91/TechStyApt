//
//  ProfileModel.swift
//  StayAPT
//
//  Created by admin on 27/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import Gloss

struct ProfileModel {
    
    let user_photo: String
    let userImage: String
    let fname: String
    let lname: String
    let loc_id: String
    let height: String
    let weight: String
    let about_me: String
    let gender: String
    let birthday: String

    init(user_photo: String, userImage: String, fname: String, lname: String, loc_id: String, height: String, weight: String, about_me: String, gender: String, birthday: String) {
       
        self.user_photo = user_photo
        self.userImage =  userImage
        self.fname = fname
        self.lname = lname
        self.loc_id = loc_id
        self.height = height
        self.weight = weight
        self.about_me = about_me
        self.gender = gender
        self.birthday = birthday
    }
    
    
    
    init?(json: JSON) {
        
        guard let status: Bool = "status" <~~ json else { return nil }
        
        self.status = status
        self.error = "message" <~~ json
        self.message = "error" <~~ json
        self.errorMessage = "message.email" <~~ json
        self.errorStayAptId = "message.stayAptID" <~~ json
        self.errorFCId = "message.fcID" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "user_photo" ~~> self.user_photo,
            "userImage" ~~> self.userImage,
            "fname" ~~> self.fname,
            "lname" ~~> self.lname,
            "loc_id" ~~> self.loc_id,
            "height" ~~> self.height,
            "weight" ~~> self.weight,
            "about_me" ~~> self.about_me,
            "gender" ~~> self.gender,
            "birthday" ~~> self.birthday
            
            ])
    }
}
