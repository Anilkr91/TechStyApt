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
    @IBOutlet weak var containerView: UIView!
    var currentViewController: UIViewController?
    
    lazy var firstChildTabVC: UIViewController? = {
        let firstChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController")
        return firstChildTabVC
    }()
    
    lazy var secondChildTabVC : UIViewController? = {
        let secondChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "BlogsTableViewController")
        return secondChildTabVC
    }()
    
    lazy var thirdChildTabVC: UIViewController? = {
        let thirdChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController")
        return thirdChildTabVC
    }()
    
    lazy var fourthChildTabVC : UIViewController? = {
        let fourthChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "GalleryCollectionViewController")
        return fourthChildTabVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentControl()
    }
    
    func segmentIndex(sender: UISegmentedControl?) {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParentViewController()
        displayCurrentTab(sender!.selectedSegmentIndex)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            vc.view.frame = self.containerView.bounds
            self.containerView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.firstChildTab.rawValue :
            vc = firstChildTabVC
        case TabIndex.secondChildTab.rawValue :
            vc = secondChildTabVC
        case TabIndex.thirdChildTab.rawValue :
            vc = thirdChildTabVC
        case TabIndex.fourthChildTab.rawValue :
            vc = fourthChildTabVC 
        default:
            return nil
        }
        return vc
    }
    
    func setupSegmentControl() {
        menuSegmentedControl.selectedSegmentIndex = TabIndex.firstChildTab.rawValue
        displayCurrentTab(TabIndex.firstChildTab.rawValue)
        menuSegmentedControl.addTarget(self, action: #selector(segmentIndex(sender:)), for: .valueChanged)
    }
}
