//
//  ProfileService+GET.swift
//  StayAPT
//
//  Created by admin on 03/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class ProfileGetService {
    static func executeRequest (_ params:[String: AnyObject], completionHandler: @escaping (ProfileResponse) -> Void) {
        
       ProgressBarView.showHUD()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "user/profile/profile", method: .get, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                print(value)
                if let data = ProfileModelResponse.init(json: value as! JSON)  {
                    print(data)
                    completionHandler(data.profile)
                    ProgressBarView.hideHUD()
                    
                } else {
                    ProgressBarView.hideHUD()
                    let error = ErrorModel.init(json: value as! JSON)
                    Alert.showAlertWithMessage("Error", message: error!.message!)
                }
                
            case .failure(let error):
                ProgressBarView.hideHUD()
                Alert.showAlertWithMessage("Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
