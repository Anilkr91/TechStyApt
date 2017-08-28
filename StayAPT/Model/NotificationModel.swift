//
//  NotificationModel.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

struct NotificationModel {
    
    let image: String
    let title: String
    let name: String
    let type: String
    
    init(image: String, name: String, title: String, type: String) {
        
        self.image = image
        self.name = name
        self.title = title
        self.type = type
        
    }
}
