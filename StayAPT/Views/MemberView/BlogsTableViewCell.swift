//
//  BlogsTableViewCell.swift
//  StayAPT
//
//  Created by admin on 28/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import Gloss

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

    var info: BlogModel? {
        didSet {
            if let info = info {
                didSetCategory(info: info)
            }
        }
    }
}

extension BlogsTableViewCell {
    func didSetCategory(info: BlogModel) {
        
        let url = URL(string: info.img)!
        let image = UIImage(named: "gym")
        
        blogsImageView.kf.setImage(with: url, placeholder: image)
        blogNameLabel.text = info.title
        blogWriterDateLabel.text = info.datetime
    }
}
