//
//  HomeViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import SpinWheelControl

class HomeViewController: BaseViewController, SpinWheelControlDataSource, SpinWheelControlDelegate {
    
    let colorPalette: [UIColor] = [UIColor.red, UIColor.black]
    let titleString: [String] = ["Notes","Goal of the Month","Ultimate Goal","Fitness Buddies","Fitness Center","My Workout","My Stats","Rate yourself"]
    
    var spinWheelControl:SpinWheelControl!
    
    func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge {
        
        let wedge = SpinWheelWedge()
        if index % 2 == 0 {
            
            wedge.shape.fillColor = colorPalette[Int(0)].cgColor
            wedge.label.font = UIFont(name: "cuyabra", size: CGFloat(Constants.iPhone_mediumFont))
            wedge.label.text = titleString[Int(index)]
        
        } else {
            wedge.shape.fillColor = colorPalette[Int(1)].cgColor
            wedge.label.font = UIFont(name: "cuyabra", size: CGFloat(Constants.iPhone_mediumFont))
            wedge.label.text = titleString[Int(index)]
            
        }
        return wedge
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let user = LoginUtils.getCurrentMemberUserLogin()
        print(user?.id)
//        let frame = CGRect(x: -150, y: 25, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
//        spinWheelControl = SpinWheelControl(frame: frame)
//        spinWheelControl.dataSource = self
//        spinWheelControl.delegate = self
//        spinWheelControl.reloadData()
//        self.view.addSubview(spinWheelControl)
    }
    
    func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt {
        return 8
    }
    
    //Target was added in viewDidLoad for the valueChanged UIControlEvent
    func spinWheelDidChangeValue(sender: AnyObject) {
        // print("Value changed to " + String(self.spinWheelControl.selectedIndex))
    }
    
    func wheel(_ wheel: SpinWheelControl, didTapOnSliceAt index: Int) {
        print(index)
    }
    
    func spinWheelDidEndDecelerating(spinWheel: SpinWheelControl) {
        print(spinWheel.selectedIndex)
        print("The spin wheel did end decelerating.")
    }
    
    func spinWheelDidRotateByRadians(radians: Radians) {
        print("The wheel did rotate this many radians - " + String(describing: radians))
    }
}
