//
//  FacilitiesCenterDetailsTimeTable.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct FacilitiesCenterDetailsTimeTable: Decodable{
    
    let status: String?
    let singleSession: String?
    let coupleSession: String?
    let freeSession: String?
    let class_id: String?
    let days: String?
    let duration: String?
    let start: String?
    let className: String?
    
    init?(json: JSON) {
//        guard let status: String = "status" <~~ json,
//            let singleSession: String = "singleSession" <~~ json,
//            let coupleSession: String = "coupleSession" <~~ json,
//            let freeSession: String = "freeSession" <~~ json,
//            let class_id: String = "class_id" <~~ json,
//            let days: String = "days" <~~ json,
//            let duration: String = "duration" <~~ json,
//            let start: String = "start" <~~ json,
//            let className: String = "className" <~~ json else { return nil }
        
        self.status = "status" <~~ json
        self.singleSession = "singleSession" <~~ json
        self.coupleSession = "coupleSession" <~~ json
        self.freeSession = "freeSession" <~~ json
        self.class_id = "class_id" <~~ json
        self.days = "days" <~~ json
        self.duration = "duration" <~~ json
        self.start = "start" <~~ json
        self.className = "className" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "status" ~~> self.status ,
            "singleSession" ~~> self.singleSession ,
            "coupleSession" ~~> self.coupleSession ,
            "freeSession" ~~> self.freeSession ,
            "class_id" ~~> self.class_id ,
            "days" ~~> self.days ,
            "duration" ~~> self.duration ,
            "start" ~~> self.start ,
            "className" ~~> self.className
            
            ])
    }
}