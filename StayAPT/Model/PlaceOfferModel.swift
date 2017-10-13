//
//  PlaceOfferModel.swift
//  StayAPT
//
//  Created by admin on 12/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct PlaceOfferModel {
    
    let user_id: String
    let fcid: String
    let offerType: String
    let amount: String
    
    init(user_id: String, fcid: String, offerType: String, amount: String) {
        
        self.user_id = user_id
        self.fcid = fcid
        self.offerType = offerType
        self.amount = amount
    }
    
    init?(json: JSON) {
        guard let user_id: String = "user_id" <~~ json,
            let fcid: String = "fcid" <~~ json,
            let offerType: String = "type" <~~ json,
            let amount: String = "amount" <~~ json else { return nil }
        
        self.user_id = user_id
        self.fcid = fcid
        self.offerType = offerType
        self.amount = amount
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            
            "user_id" ~~> self.user_id,
            "fcid" ~~> self.fcid,
            "type" ~~> self.offerType,
            "amount" ~~> self.amount
            
            ])
    }
}
