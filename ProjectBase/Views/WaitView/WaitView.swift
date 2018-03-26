//
//  WaitView.swift
//  ProjectBase
//
//  Created by Motivator on 26/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation
import MBProgressHUD

protocol WaitView {
    
    func showWaitView(text:String, view:UIView)
    func showWaitView(text:String, view:UIView, hideAfter:TimeInterval)
    func showToastMessage(text:String, view:UIView)
}


extension WaitView {
    
    func showWaitView(text:String, view:UIView) {
        showWaitView(text: text, view: view, hideAfter: 0)
    }
    
    func showWaitView(text:String, view:UIView, hideAfter:TimeInterval) {
        DispatchQueue.main.async {
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.tag = 786
            hud.mode = MBProgressHUDMode.indeterminate;
            hud.label.text = text;
            if hideAfter > 0 {
                hud.hide(animated: true, afterDelay: hideAfter)
            }
        }
    }
    
    func hideWaitView(view:UIView) {
        if let viewWithTag = view.viewWithTag(786) {
            if let waitView = viewWithTag as? MBProgressHUD {
                DispatchQueue.main.async {
                    waitView.hide(animated: true)
                }
            }
        }
    }
    
    
    func showToastMessage(text:String, view:UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.text
        hud.label.text = text
        hud.offset = CGPoint(x: 0.0, y: CGFloat(MBProgressMaxOffset))
        hud.hide(animated: true, afterDelay: 3.0)
    }
    
}

