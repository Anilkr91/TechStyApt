//
//  EmployeeListArray.swift
//  StayAPT
//
//  Created by admin on 02/11/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss

struct EmployeeListArray: Gloss.Decodable {
    
    let admin: [EmployeeListModel]?
    let frontDesk: [EmployeeListModel]?
    let generalTrainer: [EmployeeListModel]?
    let manager: [EmployeeListModel]?
    let personalTrainer: [EmployeeListModel]?
    let sales: [EmployeeListModel]?
    
    init?(json: JSON) {
        
        self.admin = "Admin" <~~ json
        self.frontDesk = "Front Desk" <~~ json
        self.generalTrainer = "General Trainer" <~~ json
        self.manager = "Manager" <~~ json
        self.personalTrainer = "Personal Trainer" <~~ json
        self.sales = "Sales" <~~ json
    }
}
