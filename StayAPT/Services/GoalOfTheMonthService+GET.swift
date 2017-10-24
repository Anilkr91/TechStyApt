//
//  GoalOfTheMonthService+GET.swift
//  StayAPT
//
//  Created by admin on 08/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class GoalOfTheMonthGetService {
    static func executeRequest (_ params:[String: AnyObject], completionHandler: @escaping (GoalOfTheMonthModel) -> Void) {
        
       ProgressBarView.showHUD()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "user/profile/profileData", method: .get, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            
            case .success(let value) :
                
                if let data = GoalOfTheMonthResponse(json: value as! JSON) {
                    print(data)
                    completionHandler(data.result)
                    ProgressBarView.hideHUD()                    
                } else {
                    ProgressBarView.hideHUD()
                    let error = ErrorModel.init(json: value as! JSON)
//                    Alert.showAlertWithMessage("Error", message: error!.message!)
                }
                
            case .failure(let error):
                ProgressBarView.hideHUD()
                Alert.showAlertWithMessage("Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
