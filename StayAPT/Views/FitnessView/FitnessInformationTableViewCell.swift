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
                didSetCategory(member)
            }
        }
    }
}

extension FitnessInformationTableViewCell {
    func didSetCategory(_ member: NotificationModel) {

        let imageUrl:String = member.userImage.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url = URL(string: imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")
        notificationImageView.kf.setImage(with: url, placeholder: placeholderImage)
        
        notificationLabel.text = member.message
        notificationNameLabel.text = member.name
    }
}
