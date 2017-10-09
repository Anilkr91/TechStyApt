//
//  GoalOfTheMonthResponse.swift
//  StayAPT
//
//  Created by admin on 08/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct GoalOfTheMonthResponse {
    
    let status: Bool
    let result: GoalOfTheMonthModel
    
    init?(json: JSON) {
        guard let status: Bool = "status" <~~ json,
            let result: GoalOfTheMonthModel = "data" <~~ json else {
                return nil
        }
        self.status = status
        self.result = result
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "status" ~~> self.status,
            "data" ~~> self.result
            ])
    }
}
