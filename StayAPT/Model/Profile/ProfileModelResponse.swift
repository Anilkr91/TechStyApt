//
//  ProfileModelResponse.swift
//  StayAPT
//
//  Created by admin on 27/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct ProfileModelResponse: Decodable {
    
    let status: Bool
    let profile: ProfileModel
    
    
    init?(json: JSON) {
        guard let status: Bool = "status" <~~ json,
            let profile: ProfileModel = "data" <~~ json else { return nil }
        
        self.status = status
        self.profile = profile
    }
}
