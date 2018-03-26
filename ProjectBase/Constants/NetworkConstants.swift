//
//  NetworkConstants.swift
//  ProjectBase
//
//  Created by Motivator on 21/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation

struct APPURL {
    
    private struct Domains {
        static let Dev = "https://reqres.in"
        static let Prod = "https://reqres.in"
    }
    
    private struct Routes {
        static let Api = "/api/"
    }
    
    private struct Paths {
        static let auth = "login"
        static let basic = "Basic"
        static let forgotPassword = "login"
        static let changePassword = "changePassword"
    }
    
    private static let Domain = Domains.Dev
    private static let Route = Routes.Api
    private static let BaseURL = Domain + Route
    
    
    /*
     Group URLs related to modules
     */
    
    //MARK: User
    static func login() -> String {
        return (APPURL.BaseURL  + Paths.auth)
    }
    
    static func forgotPassword(email:String) -> String {
        return (APPURL.BaseURL  + Paths.forgotPassword )
    }
    
    static func changePassword(email:String, currentPassword:String, newPassword:String) -> String {
        return (APPURL.BaseURL  + Paths.changePassword )
    }
    
    
    //MARK: -
}
