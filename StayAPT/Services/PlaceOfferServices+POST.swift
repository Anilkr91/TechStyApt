//
//  PlaceOfferServices+POST.swift
//  StayAPT
//
//  Created by admin on 12/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class PlaceOfferPostService {
    
    static func executeRequest (_ params:[String: Any], completionHandler: @escaping (SuccessModel) -> Void) {
        
       ProgressBarView.showHUD()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "user/profile/placeOffer", method: .post, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                
                if let data = SuccessModel.init(json: value as! JSON)  {
                    
                    if data.status == true {
                        completionHandler(data)
                        ProgressBarView.hideHUD()
                        
                    } else {
                        ProgressBarView.hideHUD()
                        let error = ErrorModel.init(json: value as! JSON)
                        
                        let message = error?.error
                        Alert.showAlertWithMessage("Error", message: message!)
                    }
                }
                
            case .failure(let error):
                ProgressBarView.hideHUD()
                Alert.showAlertWithMessage("Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
