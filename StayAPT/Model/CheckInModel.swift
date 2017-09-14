//
//  CheckInModel.swift
//  StayAPT
//
//  Created by admin on 14/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct CheckInModel {
    
    let fcID: String
    let stayAptID: String
    
    init( fcID: String, stayAptID: String) {
        self.fcID = fcID
        self.stayAptID = stayAptID
        
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "fcID" ~~> self.fcID,
            "stayAptID" ~~> self.stayAptID
            ])
    }
}
