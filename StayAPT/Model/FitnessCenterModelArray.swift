//
//  FitnessCenterModelArray.swift
//  StayAPT
//
//  Created by admin on 04/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FitnessCenterModelArray {
    
    let results: [FitnessCenterModel]
    
    init?(json: JSON) {
        
        guard let results: [FitnessCenterModel] = "fitnessCenter" <~~ json else {
            return nil
        }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "fitnessCenter" ~~> self.results
            ])
    }
}
