//
//  DashBoardMemberCountModel.swift
//  StayAPT
//
//  Created by admin on 01/11/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct DashBoardMemberCountModel: Gloss.Decodable {
    
    let status: Bool
    let checkedMember: Int
    let totalMember: Int
    
    init?(json: JSON) {
        
        guard let status: Bool = "status" <~~ json,
            let  checkedMember: Int = "data.checkedMember" <~~ json,
            let totalMember:  Int = "data.totalMember" <~~ json else { return nil }
        
        self.status = status
        self.checkedMember = checkedMember
        self.totalMember = totalMember
    }
}
