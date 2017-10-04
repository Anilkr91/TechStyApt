//
//  FitnessInformationTableViewController.swift
//  StayAPT
//
//  Created by admin on 03/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessInformationTableViewController: BaseTableViewController {
    
    var information: FitnessCenterDetailInformationModel?
    
    @IBOutlet weak var nameLabel: SmallBoldLabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var mottoLabel: UILabel!
    @IBOutlet weak var uspLabel: SmallBoldLabel!
    @IBOutlet weak var wowFeaturesLabel: SmallBoldLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    func setupViews() {
      nameLabel.text = information?.fitness_center_name
        addressLabel.text  = information?.address
//        ratingView = ""
        mottoLabel.text = information?.moto
        uspLabel.text = information?.usp
        phoneNumberLabel.text = information?.phone_number
        wowFeaturesLabel.text = information?.description
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
