//
//  MenuViewController.swift
//  StayAPT
//
//  Created by admin on 24/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {

    @IBOutlet weak var menuSegmentedControl: UISegmentedControl!
    var cvc: MenuTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupChild()
        menuSegmentedControl.addTarget(self, action: #selector(segmentIndex(sender:)), for: .valueChanged)
    }
    
    func segmentIndex(sender: UISegmentedControl?) {
        let index = sender!.selectedSegmentIndex
        
        switch index {
        case 0:
            cvc.gymArray = ["gym1", "gym2", "gym", "gym1", "gym2", "gym","gym1", "gym2", "gym", "gym1", "gym2"]
            cvc.tableView.reloadData()
    
        case 1:
            cvc.gymArray = ["GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2","GGym", "GGym2", "GGym", "GGym2"]
            cvc.tableView.reloadData()
            
        case 2:
            cvc.gymArray = ["gym1", "gym2", "gym", "gym1", "gym2", "gym","gym1", "gym2", "gym", "gym1", "gym2"]
            cvc.tableView.reloadData()
            
        case 3:
            cvc.gymArray = ["GGym", "GGym2", "GGym", "GGym2", "GGym", "GGym2","GGym", "GGym2", "GGym", "GGym2"]
            cvc.tableView.reloadData()

        default:
            print("out of bound")
        }
    }
    
    func setupChild() {
        cvc = childViewControllers[0] as! MenuTableViewController
        cvc.pvc = self
        cvc.gymArray = ["gym1", "gym2", "gym", "gym1", "gym2", "gym","gym1", "gym2", "gym", "gym1", "gym2"]
    }
}
