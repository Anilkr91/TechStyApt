//
//  EmployeeListModel.swift
//  StayAPT
//
//  Created by admin on 02/11/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import Gloss
struct EmployeeListModel: Gloss.Decodable {
    
    let id: String
    let fcID: String
    let postName: String
    let s_name: String
    let s_mobile: String
    let s_emailID: String
    let roleID: String
    
    init?(json: JSON) {
        
        guard let id: String = "id" <~~ json,
            let fcID: String = "fcID" <~~ json,
            let postName: String = "postName" <~~ json,
            let s_name: String  = "s_name" <~~ json,
            let s_mobile: String = "s_mobile" <~~ json,
            let s_emailID: String = "s_emailID" <~~ json,
            let roleID: String = "roleID" <~~ json  else { return nil }
        
        self.id = id
        self.fcID = fcID
        self.postName = postName
        self.s_name = s_name
        self.s_mobile = s_mobile
        self.s_emailID = s_emailID
        self.roleID = roleID
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "id" ~~> self.id,
            "fcID" ~~> self.fcID,
            "postName" ~~> self.postName,
            "s_name" ~~> self.s_name,
            "s_mobile" ~~> self.s_mobile,
            "s_emailID" ~~> self.s_emailID,
            "roleID" ~~> self.roleID
            
            ])
    }
}
