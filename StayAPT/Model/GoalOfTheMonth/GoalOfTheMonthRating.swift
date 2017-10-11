//
//  GoalOfTheMonthRating.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct GoalOfTheMonthRating: Decodable {
    
    let day: String
    let value: String
    
    init?(json: JSON) {
        guard let day: String = "day" <~~ json,
            let value: String = "value" <~~ json else { return nil }
        
        self.day = day
        self.value = value
        
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "day" ~~>  self.day,
            "value" ~~> self.value
            ])
    }
}
