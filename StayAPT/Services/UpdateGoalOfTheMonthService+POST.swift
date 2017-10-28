//
//  UpdateGoalOfTheMonthService+POST.swift
//  StayAPT
//
//  Created by admin on 12/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import Alamofire
import Gloss

class UpdateGoalOfTheMonthPostService {
   
    static func executeRequest (_ params:[String: Any], completionHandler: @escaping (SuccessModel) -> Void) {
        
      Loader.sharedInstance.showLoader()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "user/profile/update_goalMonth", method: .post, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                
                print(value)
                if let data = SuccessModel.init(json: value as! JSON)  {
                    
                    if data.status == true {
                        completionHandler(data)
                        Loader.sharedInstance.hideLoader()
                        
                    } else {
                        Loader.sharedInstance.hideLoader()
                        let error = ErrorModel.init(json: value as! JSON)
                        
                        let message = error?.error
                        Alert.showAlertWithMessage("Error", message: message!)
                    }
                }
                
            case .failure(let error):
                Loader.sharedInstance.hideLoader()
                Alert.showAlertWithMessage("Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
