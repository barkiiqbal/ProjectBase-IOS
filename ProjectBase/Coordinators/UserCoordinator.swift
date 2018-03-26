//
//  UserCoordinator.swift
//  ProjectBase
//
//  Created by Motivator on 19/02/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation

class UserCoordinator: NSObject {
    
    // validate username and password
    class func validateUser(username:String, password:String, completion:@escaping (User) -> Void, failer:@escaping(Error) -> Void) {
        
        let loginURL = APPURL.login()
        let param = ["email": username,
                    "password": password
                    ]
        
        NetworkCoordinator.doRequest(url: loginURL, requestMethod: .post, param: param, header: nil) { (httpResponse, json, error) in
            DPrint(httpResponse)
            DPrint(json)
            DPrint(error)
            
            guard error == nil else {
                failer(error!)
                return
            }
            
            if let token = json?["token"].stringValue  {
                var session = Session(username: username)
                guard session != nil else {
                    print("========== there is some error")
                    return
                }
                session!.token = token
                let result = UserSessionManager.shared().saveSession(session: session!)
                print("\(result.description)")
            }
            
            let user = User(JSON: [:])!
            completion(user)
        }
    }
    
    // forget password
    class func forgetPassword(username:String, completion:@escaping (User) -> Void, failer:@escaping(Error) -> Void) {
        
        let loginURL = APPURL.forgotPassword(email: username)
        let param = ["email": "peter@klaven",
                     "password": "cityslicka"
        ]
        
        NetworkCoordinator.doRequest(url: loginURL, requestMethod: .post, param: param, header: nil) { (httpResponse, json, error) in
            DPrint(httpResponse)
            DPrint(json)
            DPrint(error)
            
            guard error == nil else {
                failer(error!)
                return
            }
            
            let user = User(JSON: [:])!
            completion(user)
        }
    }
    
    class func logout(username:String, completion:@escaping (Bool) -> Void, failer:@escaping () -> Void) {
        
        let isDeleted = UserSessionManager.shared().removeSessionValues()
        if isDeleted {
            completion(true)
        }
        else {
            failer()
        }
    }
}
