//
//  ProfileResponse.swift
//  StayAPT
//
//  Created by admin on 03/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct ProfileResponse: Decodable {
    
    let userImage: String
    let fname: String
    let lname: String
    let loc_id: String
    let height: String
    let weight: String
    let about_me: String
    let gender: String
    let birthday: String
    
    init?(json: JSON) {
        guard let fname: String = "fname" <~~ json,
            let lname: String = "lname" <~~ json,
            let loc_id: String = "loc_id" <~~ json,
            let height: String = "height" <~~ json,
            let weight: String = "weight" <~~ json,
            let about_me: String = "about_me" <~~ json,
            let gender: String = "gender" <~~ json,
            let birthday: String = "birthday" <~~ json,
            let userImage: String = "userImage" <~~ json else { return nil }
        
        self.fname = fname
        self.lname = lname
        self.loc_id = loc_id
        self.height = height
        self.weight = weight
        self.about_me = about_me
        self.gender = gender
        self.birthday = birthday
        self.userImage = userImage
        
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
            "userImage" ~~> self.userImage
            ])
    }
}
