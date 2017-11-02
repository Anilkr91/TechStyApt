//
//  EmployeeListService+GET.swift
//  StayAPT
//
//  Created by admin on 02/11/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class EmployeeListGetService {
    static func executeRequest (_ params:[String: Any], _ completionHandler: @escaping (EmployeeListArray) -> Void) {
       
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "fitness_center/getAllEmployee", method: .get, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                
                if let data = EmployeeListResponse.init(json: value as! JSON)  {
                    completionHandler(data.results)
                    Loader.sharedInstance.hideLoader()
                    
                } else {
                    Loader.sharedInstance.hideLoader()
                    let error = ErrorModel.init(json: value as! JSON)
                    Alert.showAlertWithMessage("Error", message: error!.message!)
                }
                
            case .failure(let error):
                Loader.sharedInstance.hideLoader()
                Alert.showAlertWithMessage("Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
