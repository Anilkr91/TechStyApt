//
//  BlogsTableViewCell.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class BlogsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var blogsImageView: UIImageView!
    @IBOutlet weak var blogNameLabel: UILabel!
    @IBOutlet weak var blogWriterDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var info: SACheckedInMember? {
        didSet {
            if let member = info {
                didSetCategory(info: member)
            }
        }
    }
}

extension BlogsTableViewCell {
    func didSetCategory(info: SACheckedInMember) {
        blogsImageView.image = UIImage(imageLiteralResourceName: info.image)
        blogNameLabel.text = info.name
        blogWriterDateLabel.text = info.counter
    }
}
