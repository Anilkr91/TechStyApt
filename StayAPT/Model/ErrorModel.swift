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
    let error: String?
    let errorMessage: String?
    let errorStayAptId: String?
    
    init?(json: JSON) {
        
        guard let status: Bool = "status" <~~ json else { return nil }
        
        self.status = status
        self.error = "message" <~~ json
        self.message = "error" <~~ json
        self.errorMessage = "message.email" <~~ json
        self.errorStayAptId = "message.stayAptID" <~~ json
    }
}
