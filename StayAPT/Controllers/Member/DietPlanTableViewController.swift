//
//  DietPlanTableViewController.swift
//  StayAPT
//
//  Created by admin on 31/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class DietPlanTableViewController: BaseTableViewController {
    
    let array = [DietPlanModel(mealName: "Meal 1", description: "Whole grain cereals with apple\n 3 eggs whites\n 1 whole egg"),
                 DietPlanModel(mealName: "Meal 2", description: "Protein drink\n Apple\n Nuts"),
                 DietPlanModel(mealName: "Meal 3", description: "2 slice of whole grain bread with 1sp\n peanut butter\n 3 egg whites"),
                 DietPlanModel(mealName: "Meal 4", description: "2 slice of whole grain bread with 1sp\n peanut butter\n 3 egg whites"),
                 DietPlanModel(mealName: "Meal 5", description: "2 slice of whole grain bread with 1sp\n peanut butter\n 3 egg whites"),
                 DietPlanModel(mealName: "Meal 6", description: "2 slice of whole grain bread with 1sp\n peanut butter\n 3 egg whites"),
                 DietPlanModel(mealName: "Meal 7", description: "Chicken breast\n Brown rice or pasta")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DietPlanTableViewCell
        
        cell.mealButton.tag = indexPath.section
        cell.info = array[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
