//
//  UltimateGoalOfTheMonthAlert.swift
//  StayAPT
//
//  Created by admin on 11/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class UltimateGoalOfTheMonthAlert: BaseViewController {
    
    @IBOutlet weak var ultimateGoalTextField: BaseTextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        print("update ultimate goal service ")
        
        let goal = ultimateGoalTextField.text!
        
         let param = ["userId": "22", "ultimate_goal" : goal ] as [String: AnyObject]
        
           UpdateUltimateGoalOfTheMonthPostService.executeRequest(param) { (data) in
            print(data)
            }
    }
}
