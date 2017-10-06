//
//  AddVisitorsService+POST.swift
//  StayAPT
//
//  Created by admin on 05/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class AddVisitorsPostService {
    static func executeRequest (_ params:[String: AnyObject], completionHandler: @escaping (DataResponse<Any>) -> Void) {
        
        Loader.sharedInstance.showLoader()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "fitness_center/addVisitors", method: .post, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                
                print(value)
//                if let data = LoginModelResponse.init(json: value as! JSON)  {
//                    completionHandler(data)
                    Loader.sharedInstance.hideLoader()
                    
//                } else {
//                    Loader.sharedInstance.hideLoader()
//                    let error = ErrorModel.init(json: value as! JSON)
//                    Alert.showAlertWithMessage("Error", message: error!.message!)
//                }
                
            case .failure(let error):
                Loader.sharedInstance.hideLoader()
                Alert.showAlertWithMessage("Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
