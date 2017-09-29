//
//  FacilitiesCenterDetailsTrainer.swift
//  StayAPT
//
//  Created by admin on 29/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct FacilitiesCenterDetailsTrainer: Decodable {
    
    let trainerImage: String
    let trainerName: String
    
    init?(json: JSON) {
        guard let trainerImage: String = "trainerImage" <~~ json,
            let trainerName: String = "trainerName" <~~ json else { return nil }
        
        self.trainerImage = trainerImage
        self.trainerName = trainerName
    }
}
