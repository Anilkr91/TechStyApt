//
//  MemberNotificationTableViewCell.swift
//  StayAPT
//
//  Created by admin on 25/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Kingfisher

class MemberNotificationTableViewCell: UITableViewCell {
    
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

extension MemberNotificationTableViewCell {
    func didSetCategory(_ member: NotificationModel) {
        
        notificationLabel.text = member.message
        notificationNameLabel.text = member.name
        
        let imageUrl:String = member.userImage.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
           
            
//            .stringByAddingPercentEncodingWithAllowedCharacters( NSCharacterSet.URLQueryAllowedCharacterSe())!
        
         print(imageUrl)
        let url = URL(string: imageUrl)!
        
        print(imageUrl)
        
        let placeholderImage = UIImage(named: "placeholder")
        notificationImageView.kf.setImage(with: url, placeholder: placeholderImage)
    }
}
