//
//  FitnessCenterModel.swift
//  StayAPT
//
//  Created by admin on 04/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct FitnessCenterModel: Decodable {
    
    let id: String
    let name: String
    let img: String
    let address: String
    let facilities: [FacilitiesModel]

    init?(json: JSON) {
        guard let id: String = "id" <~~ json,
        let name: String = "fitness_center_name" <~~ json,
        let img: String = "logo" <~~ json,
        let address: String = "address" <~~ json,
        let facilities: [FacilitiesModel] = "facilities" <~~ json else { return nil }
        
        self.id = id
        self.name = name
        self.img = img
        self.address = address
        self.facilities = facilities
    }
}
