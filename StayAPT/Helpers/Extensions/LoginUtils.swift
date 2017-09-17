//
//  LoginUtils.swift
//  StayAPT
//
//  Created by admin on 16/09/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import SwiftyUserDefaults

class LoginUtils {
    
    class func setCurrentMemberUser(user: LoginModelResponse) {
        if let login = getCurrentMemberUserLogin() {
            let tmpLogin = login
            //tmpLogin.user = user
            setCurrentMemberUserLogin(login: tmpLogin)
        }
    }
    
    class func setCurrentFitnessCenter(user: FCLoginResponse) {
        if let login = getCurrentFitnessCenterUserLogin() {
            let tmpLogin = login
            //tmpLogin.user = user
            setCurrentFitnessCenterUserLogin(login: tmpLogin)
        } else {
           setCurrentFitnessCenterUserLogin(login: user)
        }
    }
    
    class func setCurrentMemberUserLogin(login: LoginModelResponse?) {
        if let login = login {
            
            Defaults[.memberLogin] = login.toJSON()
//            Defaults[.memberLogin] = login.toJSON()
            //Defaults[.Authtoken] = login.token
        } else {
            Defaults.removeAll()
        }
    }
    
    class func setCurrentFitnessCenterUserLogin(login: FCLoginResponse?) {
        if let login = login {
            Defaults[.fitnessCenterLogin] = login.toJSON()
            //Defaults[.Authtoken] = login.token
        } else {
            Defaults.removeAll()
        }
    }
    
    class func getCurrentMemberUserLogin() -> LoginModelResponse? {
        if let json = Defaults[.memberLogin], let user = LoginModelResponse(json: json) {
            return user
        }
        return nil
    }
    
    class func getCurrentFitnessCenterUserLogin() -> FCLoginResponse? {
     
        if let json = Defaults[.fitnessCenterLogin], let user = FCLoginResponse(json: json) {
            return user
        }
        return nil
    }
}
