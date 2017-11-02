//
//  EmployeeListResponse.swift
//  StayAPT
//
//  Created by admin on 02/11/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct EmployeeListResponse {
    
    let results: EmployeeListArray
    
    init?(json: JSON) {
        
        guard let results: EmployeeListArray = "data" <~~ json else { return nil }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "data" ~~> self.results
            ])
    }
}
