//
//  GoalOfTheMonthWorkOut.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct GoalOfTheMonthWorkOut: Decodable {
    
    let objectId: String
    let fcID: String
    let fc_name: String
    let userId: String
    let class_name: String
    let time: String
    let days: String
    
    init?(json: JSON) {
        guard let objectId: String = "id" <~~ json,
            let fcID: String = "fcID" <~~ json,
            let fc_name: String = "fc_name" <~~ json,
            let userId: String =  "userId" <~~ json,
            let class_name: String = "class_name" <~~ json,
            let time: String = "time" <~~ json,
            let days: String = "days" <~~ json else { return nil }
        
        self.objectId = objectId
        self.fcID = fcID
        self.fc_name = fc_name
        self.userId = userId
        self.class_name = class_name
        self.time = time
        self.days = days
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "id" ~~> self.objectId,
            "fcID" ~~> self.fcID,
            "fc_name" ~~> self.fc_name,
            "userId" ~~> self.userId,
            "class_name" ~~> self.class_name,
            "time" ~~> self.time,
            "days" ~~> self.days
            ])
    }
}
