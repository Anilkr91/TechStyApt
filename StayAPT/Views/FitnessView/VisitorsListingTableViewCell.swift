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
    
    var info: VisitorsModel? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension VisitorsListingTableViewCell {
    func didSetCategory(_ info: VisitorsModel) {
       
        saVisitorsImageView.image = UIImage(imageLiteralResourceName: "GGym")
        saCallIncomingImageView.image = UIImage(imageLiteralResourceName: "GGym")
        saCallOutgoingImageView.image = UIImage(imageLiteralResourceName: "GGym")
        saVisitorsNameLabel.text =  info.name
        saVisitorsMobileLabel.text = info.mobile
        saVisitorsCommentLabel.text = info.notes
        saFollowUpPersonLabel.text = info.salesPersonName
        saFollowUpLastDateLabel.text = info.date
        saFollowUpNewDateLabel.text = info.reminder
    }
}
