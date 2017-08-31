//
//  DietPlanModel.swift
//  StayAPT
//
//  Created by admin on 31/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

struct DietPlanModel {
    
    let mealName: String
    let description: String
  
    init(mealName: String, description: String) {
        
        self.mealName = mealName
        self.description = description
    }
}
