//
//  UserCoordinator.swift
//  ProjectBase
//
//  Created by Motivator on 19/02/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation

class UserCoordinator: NSObject {
    
    class func validateUser(username:String, password:String, completion:@escaping (User) -> Void, failer:@escaping(Error) -> Void) {
        
        let loginURL = APPURL.login()
        let header:[String:String] = ["Content-Type":"application/json"]
        let param = ["email": "peter@klaven",
                    "password": "cityslicka"
                    ]
        NetworkCoordinator.doRequest(url: loginURL, requestMethod: .post, param: param, header: header) { (httpResponse, json, error) in
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
}
