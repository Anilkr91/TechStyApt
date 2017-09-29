//
//  ClassModelArray.swift
//  StayAPT
//
//  Created by admin on 29/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct ClassModelArray {
    
    let results: [ClassModel]

    init?(json: JSON) {
   
        guard let results: [ClassModel] = "classes" <~~ json else {
            return nil
        }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "classes" ~~> self.results
            ])
    }
}
