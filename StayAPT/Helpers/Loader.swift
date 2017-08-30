//
//  Loader.swift
//  StayAPT
//
//  Created by admin on 30/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import UIKit

struct Loader {
    
    static let sharedInstance = Loader()
    private let activityIndicator = UIActivityIndicatorView()
    
    //MARK: - Private Methods -
    
    private init() { }
    
    private func setupLoader() {
        hideLoader()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
    }
    
    //MARK: - Public Methods -
    func showLoader() {
        setupLoader()
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let holdingView = appDel.window!.rootViewController!.view!
        
        DispatchQueue.main.async {
            self.activityIndicator.center = holdingView.center
            self.activityIndicator.startAnimating()
            holdingView.addSubview(self.activityIndicator)
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
    
    func hideLoader(){
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}
