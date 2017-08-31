//
//  BlogService+GET.swift
//  StayAPT
//
//  Created by admin on 29/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class BlogGetService {
    
    static func executeRequest (completionHandler: @escaping ([BlogModel]) -> Void) {
        
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "blog", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                if let data = BlogModelArray.init(json: value as! JSON)  {
                    completionHandler(data.results)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
