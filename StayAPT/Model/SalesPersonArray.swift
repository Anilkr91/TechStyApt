//
//  SalesPersonArray.swift
//  StayAPT
//
//  Created by admin on 05/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct SalesPersonArray {
    
    let status: Bool
    let results: [SalesPersonModel]
    
    init?(json: JSON) {
         guard let status: Bool = "status" <~~ json,
         let results: [SalesPersonModel] = "data" <~~ json else {
            return nil
        }
        self.status = status
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "status" ~~> self.status,
            "data" ~~> self.results
            ])
    }
}
