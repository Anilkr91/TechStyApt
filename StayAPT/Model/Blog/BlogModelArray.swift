//
//  BlogModelArray.swift
//  StayAPT
//
//  Created by admin on 29/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct BlogModelArray {
    
    let results: [BlogModel]
    
    init?(json: JSON) {
        
        guard let results: [BlogModel] = "blog" <~~ json else {
            return nil
        }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "blog" ~~> self.results
            ])
    }
//    
//    init?(jsonArray: [AnyObject]) {
//        let jsonDictionary = ["data" : jsonArray]
//        self.init(json: jsonDictionary)
//    }
}
