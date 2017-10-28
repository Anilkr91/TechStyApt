//
//  GoalOfTheMonthStatsModel.swift
//  StayAPT
//
//  Created by admin on 08/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct GoalOfTheMonthStatsModel: Gloss.Decodable {
    
    let chest: String
    let biceps: String
    let forearm: String
    let wrist: String
    let shoulders: String
    let waist: String
    let thighs: String
    let calves: String
    let userId: String?
    
    init (chest: String, biceps: String, forearm: String, wrist: String, shoulders: String, waist: String, thighs: String, calves: String, userId: String ) {
        
        self.chest = chest
        self.biceps = biceps
        self.forearm = forearm
        self.wrist = wrist
        self.shoulders = shoulders
        self.waist = waist
        self.thighs = thighs
        self.calves = calves
        self.userId = userId
    }
    
    init?(json: JSON) {
        guard let chest: String = "chest" <~~ json,
            let biceps: String = "biceps" <~~ json,
            let forearm: String = "forearm" <~~ json,
            let wrist: String = "wrist" <~~ json,
            let shoulders: String = "shoulders" <~~ json,
            let waist: String = "waist" <~~ json,
            let thighs: String = "thighs" <~~ json,
            let calves: String = "calves" <~~ json else { return nil }
        
        self.chest = chest
        self.biceps = biceps
        self.forearm = forearm
        self.wrist = wrist
        self.shoulders = shoulders
        self.waist = waist
        self.thighs = thighs
        self.calves = calves
        self.userId = "userId" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "chest" ~~> self.chest,
            "biceps" ~~> self.biceps,
            "forearm" ~~> self.forearm,
            "wrist" ~~> self.wrist,
            "shoulders" ~~> self.shoulders,
            "waist" ~~> self.waist,
            "thighs" ~~> self.thighs,
            "calves" ~~> self.calves,
            "userId" ~~> self.userId
            ])
    }
}
