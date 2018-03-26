//
//  NavigationHelper.swift
//  ProjectBase
//
//  Created by Motivator on 26/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation
import UIKit

func showLoginScreen() {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
    let nav = mainStoryboard.instantiateViewController(withIdentifier: "LoginNavigation")
    
    UIView.transition(with: appdelegate.window!, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
        appdelegate.window!.rootViewController = nav
    }, completion: nil)
}


func showHomeScreen() {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Application", bundle: nil)
    let nav = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigation")
    
    UIView.transition(with: appdelegate.window!, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
        appdelegate.window!.rootViewController = nav
    }, completion: nil)
}
