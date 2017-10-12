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
        
        let chest = chestTextField.text!
        let biceps = bicepsTextField.text!
        let foreArm = foreArmTextField.text!
        let wrist =   wristTextField.text!
        let shoulders = shouldersTextField.text!
        let waist = waistTextField.text!
        let thighs = thighsTextField.text!
        let calves =  calvesTextField.text!
        
//        let id = "22"
        
//        if let id = id {
        
            let params = GoalOfTheMonthStatsModel(chest: chest, biceps: biceps, forearm: foreArm, wrist: wrist, shoulders: shoulders, waist: waist, thighs: thighs, calves: calves, userId: "22").toJSON()
//        }
        
        
        print(params)

        UpdateGoalOfTheMonthStatsPostService.executeRequest(params!) { (data) in
            print(data)
        }
    }
}
