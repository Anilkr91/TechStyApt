//
//  NotificationModelArray.swift
//  StayAPT
//
//  Created by admin on 25/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct NotificationModelArray {
    
    let results: [NotificationModel]
    
    init?(json: JSON) {
        
        guard let results: [NotificationModel] = "data" <~~ json else {
            return nil
        }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "data" ~~> self.results
            ])
    }
}
