//
//  FitnessNotificationTableViewCell.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class FitnessNotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationNameLabel: UILabel!
    @IBOutlet weak var notificationAcceptButton: UIButton!
    @IBOutlet weak var notificationRejectButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var member: NotificationModel? {
        didSet {
            if let member = member {
                didSetCategory(member)
            }
        }
    }
}

extension FitnessNotificationTableViewCell {
    func didSetCategory(_ member: NotificationModel) {
//        notificationImageView.image = UIImage(imageLiteralResourceName: member.image)
//        notificationLabel.text = member.title
//        notificationNameLabel.text = member.name
//        
//        if member.type == Notification.Request.rawValue {
//            notificationAcceptButton.addTarget(self, action: #selector(Acceptrequest), for: .touchUpInside)
//             notificationRejectButton.addTarget(self, action: #selector(Rejectrequest), for: .touchUpInside)
//        }
    }
    
    func Acceptrequest(_ sender: UIButton) {
        print(sender.tag)
    }
    
    func Rejectrequest(_ sender: UIButton) {
        print(sender.tag)
    }
}
