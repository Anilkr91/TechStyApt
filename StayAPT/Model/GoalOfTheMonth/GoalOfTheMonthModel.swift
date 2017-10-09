//
//  GoalOfTheMonthModel.swift
//  StayAPT
//
//  Created by admin on 08/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Gloss
struct GoalOfTheMonthModel: Decodable {
    
    let goalMonth: String
    let ultimateGoal: String
    let notes: String
    let stats: GoalOfTheMonthStatsModel
    let favouriteFitnessCenter: [GoalOfTheMonthFavouriteFitnessCenter]
    let workOut: [GoalOfTheMonthWorkOut]
    let rating: [GoalOfTheMonthRating]
    
    
    init?(json: JSON) {
        guard let goalMonth: String = "goal_month" <~~ json,
            let ultimateGoal: String = "ultimate_goal" <~~ json,
            let notes: String = "notes" <~~ json,
            let stats: GoalOfTheMonthStatsModel = "stats" <~~ json,
            let favouriteFitnessCenter: [GoalOfTheMonthFavouriteFitnessCenter] = "favFC" <~~ json,
            let workOut: [GoalOfTheMonthWorkOut] = "workout" <~~ json,
            let rating: [GoalOfTheMonthRating] = "rate" <~~ json else { return nil }
        
        self.goalMonth = goalMonth
        self.ultimateGoal = ultimateGoal
        self.notes = notes
        self.stats = stats
        self.favouriteFitnessCenter = favouriteFitnessCenter
        self.workOut = workOut
        self.rating = rating
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "goal_month" ~~> self.goalMonth,
            "ultimate_goal" ~~> self.ultimateGoal,
            "notes" ~~> self.notes,
            "stats" ~~> self.stats,
            "favFC" ~~> self.favouriteFitnessCenter,
            "workout"  ~~> self.workOut,
            "rate"  ~~> self.rating
            
            ])
    }
}
