//
//  FitnessInformationTableViewCell.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    var member: NotificationModel? {
        didSet {
            if let member = member {
                didSetCategory(member: member)
            }
        }
    }
}

extension FitnessInformationTableViewCell {
    func didSetCategory(member: NotificationModel) {
        notificationImageView.image = UIImage(imageLiteralResourceName: member.image)
        notificationLabel.text = member.title
        notificationNameLabel.text = member.name
    }
}
