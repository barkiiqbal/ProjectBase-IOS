//
//  AppDelegateCoordinator.swift
//  ProjectBase
//
//  Created by Motivator on 23/01/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit

class AppDelegateCoordinator: NSObject {

    // Can't init is singleton
    private override init() { }
    
    // MARK: Shared Instance
    static let shared = AppDelegateCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true;
    }
}
