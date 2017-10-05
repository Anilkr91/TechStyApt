//
//  SalesPersonModel.swift
//  StayAPT
//
//  Created by admin on 05/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct SalesPersonModel: Decodable {
    
    let id: String
    let name: String
   
    init?(json: JSON) {
        guard let id: String = "id" <~~ json,
            let name: String = "s_name" <~~ json else { return nil }
        
        self.id = id
        self.name = name
    }
}
