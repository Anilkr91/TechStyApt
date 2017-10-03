//
//  UploadImageService+POST.swift
//  StayAPT
//
//  Created by admin on 02/10/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import Alamofire
import Gloss

class UploadImagePostService {
    static func executeRequest (_ data: Data, completionHandler: @escaping (Data) -> Void) {
        
        Loader.sharedInstance.showLoader()
        let BaseURL = Constants.BASE_URL
        let user = LoginUtils.getCurrentMemberUserLogin()
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
         let headers: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let parameters: Parameters = ["userId": user?.id,
                                      "newImage": ""
                                      ]
        
        let request =  manager.upload(multipartFormData:{ multipartFormData in
            
            multipartFormData.append(data, withName: "newImage", fileName: "image", mimeType: "image/png")
//             multipartFormData.append(, withName: "userId")
            
        },
                                      usingThreshold:UInt64.init(),
                                      to: BaseURL + "profileImage",
                                      method:.post,
                                      headers: headers,
                                      encodingCompletion: { encodingResult in
                                        
                                        switch encodingResult {
                                            
                                        case .success(let upload, _, _):
                                            
                                            upload.responseJSON { response in
                                                
                                                print(response)
//                                                if let info = response.result.value as? [String: Any]  {
//                                                    
////                                                    let data = ImageModel(json: info )
//                                                    
//                                                    completionHandler(data)
//                                                }
                                            }
                                            
                                        case .failure(let encodingError):
                                            print(encodingError)
                                        }
        })
        debugPrint(request)
    }
}
