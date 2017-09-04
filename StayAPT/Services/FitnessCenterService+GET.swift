//
//  FitnessCenterService+GET.swift
//  StayAPT
//
//  Created by admin on 04/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//


import Alamofire
import Gloss

class FitnessCenterGetService {
    static func executeRequest (params:[String: AnyObject], completionHandler: @escaping ([FitnessCenterModel]) -> Void) {
        
         let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "fitness_center", method: .get, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                
               if let data = FitnessCenterModelArray.init(json: value as! JSON)  {
                completionHandler(data.results)
                }
                
               let error = ErrorModel.init(json: value as! JSON)
               print(error!.message)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
