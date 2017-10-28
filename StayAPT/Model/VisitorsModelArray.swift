//
//  VisitorsModelArray.swift
//  StayAPT
//
//  Created by admin on 05/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct VisitorsModelArray {
    
    let status: Bool
    let results: [VisitorsModel]
    
    init?(json: JSON) {
        guard let status: Bool = "status" <~~ json,
            let results: [VisitorsModel] = "data" <~~ json else {
                return nil
        }
        self.status = status
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "status" ~~> self.status,
            "message" ~~> self.results
            ])
    }
}
