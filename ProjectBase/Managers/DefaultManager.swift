//
//  DefaultManager.swift
//  ProjectBase
//
//  Created by Motivator on 26/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit

class DefaultManager: NSObject {

    private let userDefaults:UserDefaults
    private static var sharedDefaultManager: DefaultManager = {
        let sessionManager = DefaultManager()
        return sessionManager
    }()
    
    override init() {
        
        userDefaults =  UserDefaults.standard
        super.init()
    }
    
    
    // MARK: - Accessors
    
    class func shared() -> DefaultManager {
        return sharedDefaultManager
    }
    
    
    //MARK: - String
    
    class func save(string:String, key:String) {
        let userDefault = DefaultManager.shared().userDefaults
        userDefault.set(string, forKey: key)
        userDefault.synchronize()
    }
    
    class func get(key:String) -> String? {
        let userDefault = DefaultManager.shared().userDefaults
        return userDefault.value(forKey: key) as? String
    }
    
}
