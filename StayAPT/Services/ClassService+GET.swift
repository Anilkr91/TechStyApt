//
//  ClassService+GET.swift
//  StayAPT
//
//  Created by admin on 29/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class ClassGetService {
    static func executeRequest (completionHandler: @escaping ([ClassModel]) -> Void) {
        
        Loader.sharedInstance.showLoader()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "classes", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                if let data = ClassModelArray.init(json: value as! JSON)  {
                    completionHandler(data.results)
                    Loader.sharedInstance.hideLoader()
                    
                } else {
                    Loader.sharedInstance.hideLoader()
                    let error = ErrorModel.init(json: value as! JSON)
                    Alert.showAlertWithMessage(title: "Error", message: error!.message)
                }
                
            case .failure(let error):
                Loader.sharedInstance.hideLoader()
                 Alert.showAlertWithMessage(title: "Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
