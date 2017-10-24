//
//  EditProfileService+POST.swift
//  StayAPT
//
//  Created by admin on 27/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class EditProfilePostService {
    
//    static func executeRequest (data: Data, _ params:[String: Any], completionHandler: @escaping (SuccessModel) -> Void) {
//        
//       ProgressBarView.showHUD()
//        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
//        let URL = Constants.BASE_URL
//        //        //
//        let manager = Alamofire.SessionManager.default
//        manager.session.configuration.timeoutIntervalForRequest = 60
//
////        let data = UIImagePNGRepresentation(image)!
//        
//        let request =  manager.upload(multipartFormData:{ multipartFormData in
//            
//            multipartFormData.append("test".data(using: .utf8)!, withName: "userImage", mimeType: "image/png")
//            multipartFormData.append("Anil".data(using: .utf8)!, withName: "fname")
//            multipartFormData.append("Kumar".data(using: .utf8)!, withName: "lname")
//            multipartFormData.append("5".data(using: .utf8)!, withName: "loc_id")
//            multipartFormData.append("51".data(using: .utf8)!, withName: "height")
//             multipartFormData.append("56".data(using: .utf8)!, withName: "weight")
//             multipartFormData.append("about me lorem ipsum".data(using: .utf8)!, withName: "about_me")
//             multipartFormData.append("12-04-1991".data(using: .utf8)!, withName: "birthday")
//            },
//                                      
//                                      usingThreshold:UInt64.init(),
//                                      to:URL + "profile/update_profile",
//                                      method:.post,
//                                      headers: header,
//                                      encodingCompletion: { encodingResult in
//                                        switch encodingResult {
//                                        case .success(let upload, _, _):
//                                           
//                                            debugPrint(upload)
//                                            upload.responseJSON { response in
//                                                debugPrint(response)
//                                            }
//                                        case .failure(let encodingError):
//                                            print(encodingError)
//                                        }
//        })
//        
//        debugPrint(request)
//    }
    
    static func executeRequest (_ params:[String: AnyObject], completionHandler: @escaping (SuccessModel) -> Void) {
        
       ProgressBarView.showHUD()
        let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let request = manager.request( URL + "user/profile/update_profile", method: .post, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                if let data = SuccessModel.init(json: value as! JSON)  {
                    completionHandler(data)
                    ProgressBarView.hideHUD()
                    
                } else {
                    ProgressBarView.hideHUD()
                    let error = ErrorModel.init(json: value as! JSON)
                    Alert.showAlertWithMessage("Error", message: error!.errorMessage!)
                }
                
                
            case .failure(let error):
                ProgressBarView.hideHUD()
                Alert.showAlertWithMessage("Error", message: error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
