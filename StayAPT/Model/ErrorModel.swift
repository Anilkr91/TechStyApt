//
//  ErrorModel.swift
//  StayAPT
//
//  Created by admin on 04/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct ErrorModel: Decodable {
    
    let status: Bool
    let message: String
    
    init?(json: JSON) {
        guard let status: Bool = "status" <~~ json,
            let message: String = "error" <~~ json else { return nil }
        
        self.status = status
        self.message = message
    }
}
