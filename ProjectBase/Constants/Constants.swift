//
//  Constants.swift
//  ProjectBase
//
//  Created by Motivator on 23/01/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation
import UIKit

//ColorConstants.swift
public struct AppColor {
    
    private struct Alphas {
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.8)
        static let SemiTransparent = CGFloat(0.5)
        static let Transparent = CGFloat(0.3)
    }
    
    static let appPrimaryColor =  UIColor.white.withAlphaComponent(Alphas.SemiOpaque)
    static let appSecondaryColor =  UIColor.blue.withAlphaComponent(Alphas.Opaque)
    
    struct TextColors {
        static let Error = AppColor.appSecondaryColor
        static let Success = UIColor(red: 0.1303, green: 0.9915, blue: 0.0233, alpha: Alphas.Opaque)
    }
    
    struct TabBarColors {
        static let Selected = UIColor.white
        static let NotSelected = UIColor.black
    }
    
    struct OverlayColor {
        static let SemiTransparentBlack = UIColor.black.withAlphaComponent(Alphas.Transparent)
        static let SemiOpaque = UIColor.black.withAlphaComponent(Alphas.SemiOpaque)
        static let demoOverlay = UIColor.black.withAlphaComponent(0.6)
    }
}


struct APPURL {
    
    private struct Domains {
        static let Dev = "https://reqres.in"
//        static let UAT = "http://test-UAT.com"
//        static let Local = "192.145.1.1"
//        static let QA = "https://reqres.in"
        static let Prod = "https://reqres.in"
    }
    
    private struct Routes {
        static let Api = "/api/"
    }
    
    private struct Paths {
        static let auth = "login"
        static let basic = "Basic"
        static let forgotPassword = "forgotPassword"
        static let changePassword = "changePassword"
    }
    
    private static let Domain = Domains.Dev
    private static let Route = Routes.Api
    private static let BaseURL = Domain + Route
    
    
    // user
    static func login() -> String {
        return (APPURL.BaseURL  + Paths.auth)
    }
    
    static func forgotPassword(email:String) -> String {
        return (APPURL.BaseURL  + Paths.forgotPassword )
    }
    
    static func changePassword(email:String, currentPassword:String, newPassword:String) -> String {
        return (APPURL.BaseURL  + Paths.forgotPassword )
    }
    
    
}

