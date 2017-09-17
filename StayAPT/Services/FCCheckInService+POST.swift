//
//  FCCheckInService+POST.swift
//  StayAPT
//
//  Created by admin on 14/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class FCCheckInServicePostService {
    static func executeRequest (params:[String: AnyObject], completionHandler: @escaping (SuccessModel) -> Void) {
        
        Loader.sharedInstance.showLoader()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "fitness_center/checkIn", method: .post, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                if let data = SuccessModel.init(json: value as! JSON) {
                    
                    if data.status == true {
                        completionHandler(data)
                        Loader.sharedInstance.hideLoader()
                        
                    } else {
                        Loader.sharedInstance.hideLoader()
                        let error = ErrorModel.init(json: value as! JSON)
                        Alert.showAlertWithMessage(title: "Error", message: error!.errorStayAptId!)
                        
                    }
                }
                
            case .failure(let error):
                Loader.sharedInstance.hideLoader()
                Alert.showAlertWithMessage(title: "Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
