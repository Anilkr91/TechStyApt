//
//  BaseViewController.swift
//  StayAPT
//
//  Created by admin on 24/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //view.backgroundColor = UIColor(red: 53/255, green: 53/255, blue: 53/255, alpha: 1)
    }
    
}

class BaseTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
         //view.backgroundColor = UIColor(red: 53/255, green: 53/255, blue: 53/255, alpha: 1)
    }
}

class BaseCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //collectionView?.backgroundColor = UIColor(red: 53/255, green: 53/255, blue: 53/255, alpha: 1)
    }
    
}

//extension UIViewController {
//    
//    func showAlert(_ title: String, msg: String) {
//        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
//    }
//}
