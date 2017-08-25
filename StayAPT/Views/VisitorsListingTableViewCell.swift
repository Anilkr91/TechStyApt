//
//  VisitorsListingTableViewCell.swift
//  StayAPT
//
//  Created by admin on 25/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class VisitorsListingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var saVisitorsImageView: UIImageView!
    @IBOutlet weak var saCallIncomingImageView: UIImageView!
    @IBOutlet weak var saCallOutgoingImageView: UIImageView!
    
    
    @IBOutlet weak var saVisitorsNameLabel: UILabel!
    @IBOutlet weak var saVisitorsMobileLabel: UILabel!
    @IBOutlet weak var saVisitorsCommentLabel: UILabel!
    @IBOutlet weak var saFollowUpPersonLabel: UILabel!
    @IBOutlet weak var saFollowUpLastDateLabel: UILabel!
    @IBOutlet weak var saFollowUpNewDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
