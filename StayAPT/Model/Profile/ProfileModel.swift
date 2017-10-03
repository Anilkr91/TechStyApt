//
//  ProfileModel.swift
//  StayAPT
//
//  Created by admin on 27/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import Gloss

struct ProfileModel {
    
    let fname: String
    let lname: String
    let loc_id: String
    let height: String
    let weight: String
    let about_me: String
    let gender: String
    let birthday: String
    let userId: String
    
    init(fname: String, lname: String, loc_id: String, height: String, weight: String, about_me: String, gender: String, birthday: String, userId: String ) {
        
        self.fname = fname
        self.lname = lname
        self.loc_id = loc_id
        self.height = height
        self.weight = weight
        self.about_me = about_me
        self.gender = gender
        self.birthday = birthday
        self.userId = userId
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "fname" ~~> self.fname,
            "lname" ~~> self.lname,
            "loc_id" ~~> self.loc_id,
            "height" ~~> self.height,
            "weight" ~~> self.weight,
            "about_me" ~~> self.about_me,
            "gender" ~~> self.gender,
            "birthday" ~~> self.birthday,
            "userId" ~~> self.userId
            
            ])
    }
}
