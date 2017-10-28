//
//  LocationModel.swift
//  StayAPT
//
//  Created by admin on 13/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct LocationModel: Gloss.Decodable {
    
    let loc_id: String
    let location_name: String
    
    init( loc_id: String, location_name: String) {
        self.loc_id = loc_id
        self.location_name = location_name
    }
    
    init?(json: JSON) {
        guard let loc_id: String = "loc_id" <~~ json,
            let location_name: String = "location_name" <~~ json else { return nil }
        
        self.loc_id = loc_id
        self.location_name = location_name
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "email" ~~> self.loc_id,
            "password" ~~> self.location_name
            ])
    }
}
