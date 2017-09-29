//
//  LocationModelArray.swift
//  StayAPT
//
//  Created by admin on 13/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct LocationModelArray {
    
    let results: [LocationModel]
    
    init?(json: JSON) {
        
        guard let results: [LocationModel] = "location" <~~ json else {
            return nil
        }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "location" ~~> self.results
            ])
    }
}
