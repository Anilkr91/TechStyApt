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
    let message: String?
    let errorMessage: String?
    
    init?(json: JSON) {
        print(json)
        guard let status: Bool = "status" <~~ json else { return nil }
        
        self.status = status
        self.message = "error" <~~ json
        self.errorMessage = "message.email" <~~ json
    }
}
