//
//  TimeTableModel.swift
//  StayAPT
//
//  Created by admin on 11/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import Gloss
struct TimeTableModel {
    
    let status: String
    let singleSession: String
    let coupleSession: String
    let freeSession: String
    let class_id: String
    let days: String
    let duration: String
    let start: String
    let className: String

    init (status: String, singleSession: String, coupleSession: String, freeSession: String, class_id: String, days: String, duration: String, start: String, className: String) {
        
        self.status = status
        self.singleSession = singleSession
        self.coupleSession = coupleSession
        self.freeSession = freeSession
        self.class_id = class_id
        self.days = days
        self.duration = duration
        self.start = start
        self.className = className
    }
}
