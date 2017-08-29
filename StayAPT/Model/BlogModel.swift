//
//  BlogModel.swift
//  StayAPT
//
//  Created by admin on 29/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import Gloss

struct BlogModel: Decodable {
    
    let id: String
    let title: String
    let datetime: String
    let des: String
    let img: String
    
    init?(json: JSON) {
        guard let id: String = "id" <~~ json,
            let title: String = "title" <~~ json,
            let datetime: String = "datetime" <~~ json,
            let des: String = "des" <~~ json,
            let img: String = "img" <~~ json else { return nil }
        
        self.id = id
        self.title = title
        self.datetime = datetime
        self.des = des
        self.img = img
    }
}
