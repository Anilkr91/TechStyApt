//
//  GoalOfTheMonthNotesAlert.swift
//  StayAPT
//
//  Created by admin on 11/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class GoalOfTheMonthNotesAlert: BaseViewController {
    
    @IBOutlet weak var notesTextField: BaseTextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {

         print("update notes service ")
        
         let notes = notesTextField.text!
        
         let param = ["userId": "22", "notes" : notes ] as [String: AnyObject]
        
        UpdateGoalOfTheMonthNotesPostService.executeRequest(param) { (data) in
            print(data)
        }
    }
}
