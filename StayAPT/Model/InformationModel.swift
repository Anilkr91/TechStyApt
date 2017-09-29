//
//  InformationModel.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct InformationModel {
    
    let id: String
    let fitness_center_name: String
    let address: String
    let map: String
    let phone_number: String
    let alternate_number: String
    let moto: String
    let usp: String
    let description: String
    
    init?(json: JSON) {
        guard let id: String = "id" <~~ json,
            let fitness_center_name: String = "fitness_center_name" <~~ json,
            
            let address: String = "address" <~~ json,
            let map: String = "map" <~~ json,
            let phone_number: String = "phone_number" <~~ json,
            let alternate_number: String = "alternate_number" <~~ json,
            let moto: String = "moto" <~~ json,
            let usp: String = "usp" <~~ json,
            let description: String = "description" <~~ json else { return nil }
        
        self.id = id
        self.fitness_center_name = fitness_center_name
        self.address = address
        self.map = map
        self.phone_number = phone_number
        self.alternate_number = alternate_number
        self.moto = moto
        self.usp = usp
        self.description = description
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.id,
            "fitness_center_name" ~~> self.fitness_center_name,
            "address" ~~> self.address,
            "map" ~~> self.map,
            "phone_number" ~~> self.phone_number,
            "alternate_number" ~~> self.alternate_number,
            "moto" ~~> self.moto,
            "usp" ~~> self.usp,
            "description" ~~> self.description
            ])
    }
}
