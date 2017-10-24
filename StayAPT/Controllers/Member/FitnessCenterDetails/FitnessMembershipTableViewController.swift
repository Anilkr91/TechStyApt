//
//  FitnessMembershipTableViewController.swift
//  StayAPT
//
//  Created by admin on 04/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import MZFormSheetPresentationController

class FitnessMembershipTableViewController: BaseTableViewController {
    
    var membership: [FacilitiesCenterDetailsMembership] = []
    var array: [MembershipModel] = []
    var object: MembershipModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMembershipArray()
    }
    
    func setupMembershipArray() {
        for member in membership.enumerated() {
            
            let element = member.element
            
            let monthly = MembershipModel(monthlyPrice: element.monthly.monthlyPrice!, membershipPlanMonthly: element.monthly.membershipPlanMonthly!, featuresMonthly: element.monthly.featuresMonthly!, offersMonthly: element.monthly.offersMonthly!)
            
            let quaterly = MembershipModel(monthlyPrice: element.quaterly.monthlyPrice!, membershipPlanMonthly: element.quaterly.membershipPlanMonthly!, featuresMonthly: element.quaterly.featuresMonthly!, offersMonthly: element.quaterly.offersMonthly!)
            
            let halfYearly = MembershipModel(monthlyPrice: element.halfYearly.monthlyPrice!, membershipPlanMonthly: element.halfYearly.membershipPlanMonthly!, featuresMonthly: element.halfYearly.featuresMonthly!, offersMonthly: element.halfYearly.offersMonthly!)
            
            let yearly = MembershipModel(monthlyPrice: element.yearly.monthlyPrice!, membershipPlanMonthly: element.yearly.membershipPlanMonthly!, featuresMonthly: element.yearly.featuresMonthly!, offersMonthly: element.yearly.offersMonthly!)
    
            array.append(monthly)
            array.append(quaterly)
            array.append(halfYearly)
            array.append(yearly)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!
        FitnessMembershipTableViewCell
        print(array[indexPath.section])
        cell.info = array[indexPath.section]
        cell.offerButton.tag  = indexPath.section
        cell.offerButton.addTarget(self, action: #selector(placeOffer(_:)), for: .touchUpInside)
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func placeOffer(_ sender: UIButton) {
    
        object = array[sender.tag]
        performSegue(withIdentifier: "showOfferSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showOfferSegue" {
            
            let presentationSegue = segue as! MZFormSheetPresentationViewControllerSegue
            let navigationController = presentationSegue.formSheetPresentationController.contentViewController as! PlaceOfferAlert
            let formSheetController = MZFormSheetPresentationViewController(contentViewController: navigationController)
            formSheetController.presentationController?.contentViewSize = CGSize(width: 280, height: 350)
            formSheetController.presentationController?.shouldCenterVertically = true
            formSheetController.contentViewControllerTransitionStyle = .bounce
            formSheetController.presentationController?.shouldDismissOnBackgroundViewTap = true
            self.present(formSheetController, animated: true, completion: nil)
            navigationController.titleLabel.text = "Make an Offer"
            navigationController.object = object
        }
    }
}
