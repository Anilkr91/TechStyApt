//
//  NotificationModel.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct NotificationModel: Gloss.Decodable {
    
    let created: String
    let id: String
    let is_read: String
    let message: String
    let name: String
    let notificationName: String
    let subject: String
    let userImage: String
    
    init?(json: JSON) {
        guard let created: String = "created" <~~ json,
        let id: String = "id" <~~ json,
        let is_read: String = "is_read" <~~ json,
        let message: String = "message" <~~ json,
        let name: String = "name" <~~ json,
        let notificationName: String = "notificationName" <~~ json,
        let subject: String = "subject" <~~ json,
        let userImage: String = "userImage" <~~ json else { return nil }
        
        self.created = created
        self.id = id
        self.is_read = is_read
        self.message = message
        self.name = name
        self.notificationName =  notificationName
        self.subject = subject
        self.userImage = userImage
    }
}
