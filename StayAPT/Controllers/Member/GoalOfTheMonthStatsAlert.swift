//
//  GoalOfTheMonthStatsAlert.swift
//  StayAPT
//
//  Created by admin on 12/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class GoalOfTheMonthStatsAlert: BaseViewController {
    
    @IBOutlet weak var chestTextField: BaseTextField!
    @IBOutlet weak var bicepsTextField: BaseTextField!
    @IBOutlet weak var foreArmTextField: BaseTextField!
    @IBOutlet weak var wristTextField: BaseTextField!
    @IBOutlet weak var shouldersTextField: BaseTextField!
    @IBOutlet weak var waistTextField: BaseTextField!
    @IBOutlet weak var thighsTextField: BaseTextField!
    @IBOutlet weak var calvesTextField: BaseTextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
     
         print("stats service ")
//        UpdateGoalOfTheMonthPostService.executeRequest([String : Any]) { (<#SuccessModel#>) in
//            <#code#>
//        }

    }
}
