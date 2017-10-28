//
//  ProfileModelResponse.swift
//  StayAPT
//
//  Created by admin on 27/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct ProfileModelResponse: Gloss.Decodable {
    
    let status: Bool
    let profile: ProfileResponse
    
    
    init?(json: JSON) {
        guard let status: Bool = "status" <~~ json,
            let profile: ProfileResponse = "data" <~~ json else { return nil }
        
        self.status = status
        self.profile = profile
    }
}
