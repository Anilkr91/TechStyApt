//
//  GoalOfTheMonthRateCell.swift
//  StayAPT
//
//  Created by admin on 09/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
//import SwiftChart
import Kingfisher

class  GoalOfTheMonthRateCell: UITableViewCell {
    
    @IBOutlet weak var ratingGraph: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var info: GoalOfTheMonthRating? {
        didSet {
            if let member = info {
                didSetCategory(member)
            }
        }
    }
}

extension GoalOfTheMonthRateCell {
    func didSetCategory(_ info: GoalOfTheMonthRating) {
        
       // editButton.addTarget(self, action: #selector(animation), for: .touchUpInside)
        print(info)
        //        let url = URL(string: info)!
        //        let placeholderImage = UIImage(named: "placeholder")
        
        //        membershipImageView.kf.setImage(with: url, placeholder: placeholderImage)
        //        priceLabel.text = info.price
        //        discountLabel.text = info.offers.first
    }

//    func setupRateGraph() {
//        
//        let chart = Chart(frame: CGRect(x: 0, y: 0, width: 375, height: 15
////        let series = ChartSeries([0, 6, 2, 8, 4, 7, 3, 10, 8])
//            let series = 
//        
//        series.color = ChartColors.greenColor()
//        chart.add(series)
//    }
}
