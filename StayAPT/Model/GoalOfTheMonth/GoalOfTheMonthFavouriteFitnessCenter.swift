//
//  GoalOfTheMonthFavouriteFitnessCenter.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct GoalOfTheMonthFavouriteFitnessCenter: Decodable {
    
    let id: String
    let logo: String
    let fitness_center_name: String
    let address: String
    
    
    init?(json: JSON) {
        guard let id: String = "id" <~~ json,
            let logo: String  = "logo" <~~ json,
            let fitness_center_name: String  = "fitness_center_name" <~~ json,
            let address: String  = "address" <~~ json else { return nil }
        
        self.id = id
        self.logo = logo
        self.fitness_center_name = fitness_center_name
        self.address = address
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "id" ~~> self.id,
            "logo" ~~> self.logo,
            "fitness_center_name" ~~> self.fitness_center_name,
            "address" ~~> self.address
            
            ])
    }
}
