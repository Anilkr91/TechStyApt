//
//  GoalOfTheMonthAlert.swift
//  StayAPT
//
//  Created by admin on 11/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class GoalOfTheMonthAlert: BaseViewController {
    
     @IBOutlet weak var goalOfTheMonthTextField: BaseTextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        
        let goal = goalOfTheMonthTextField.text!
        
        let param = ["userId": "22", "goal_month" : goal ] as [String: AnyObject]
        
        
        UpdateGoalOfTheMonthPostService.executeRequest(param) { (data) in
                        print(data)
                    }
        
        print("update goal of the month service ")
    }
}
