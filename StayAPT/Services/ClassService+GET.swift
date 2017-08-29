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
        
        let header: HTTPHeaders = ["X_API_KEY" : "123456"]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "classes", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
               if let data = ClassModelArray.init(json: value as! JSON)  {
                completionHandler(data.results)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
