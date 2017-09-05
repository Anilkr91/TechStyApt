//
//  FitnessCenterViewController.swift
//  StayAPT
//
//  Created by admin on 04/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessCenterViewController: BaseViewController {
    
    var cvc: FitnessCenterTableViewController!
    var classId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cvc = childViewControllers[0] as! FitnessCenterTableViewController
        cvc.pvc = self
    }
}
