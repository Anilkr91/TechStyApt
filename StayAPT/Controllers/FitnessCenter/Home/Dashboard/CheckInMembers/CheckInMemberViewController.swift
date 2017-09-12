//
//  CheckInMemberViewController.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class CheckInMemberViewController: BaseViewController {
    
    @IBOutlet weak var menuSegmentedControl: UISegmentedControl!
    var cvc: CheckedInMemberCollectionViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChild()
        menuSegmentedControl.addTarget(self, action: #selector(segmentIndex(sender:)), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupChild() {
        cvc = childViewControllers[0] as! CheckedInMemberCollectionViewController
        cvc.pvc = self
        cvc.memberArray = [ SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
        SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20")
        ]
        
    }
    
    func segmentIndex(sender: UISegmentedControl?) {
        let index = sender!.selectedSegmentIndex
        
        switch index {
        case 0:
            cvc.memberArray = [ SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Prakash", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Ram Rahim", counter: "20/20")
            ]
            cvc.collectionView?.reloadData()
            
        case 1:
            cvc.memberArray = [
                                SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Prakash", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Ankur", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "John", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Rohit", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Ram Rahim", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Abhram", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "John", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Rohan", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Prakash", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Ankur", counter: "20/20"),
                                SACheckedInMember(image: "GGym", name: "Bhagat", counter: "20/20"),
                                SACheckedInMember(image: "GGym2", name: "Ram Rahim", counter: "20/20")
            ]
            cvc.collectionView?.reloadData()
        default:
            print("out of bound")
        }
    }
}
