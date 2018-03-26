//
//  BaseViewController.swift
//  ProjectBase
//
//  Created by Motivator on 21/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController, WaitView {
    
    /*
     hide navigation bar depending on the value
     */
    private var _shouldHideNavigationBar:Bool = false
    public var shouldHideNavigationBar:Bool  {
        get {
            return _shouldHideNavigationBar;
        }
        set {
            _shouldHideNavigationBar = newValue
            navigationController?.navigationBar.isHidden = _shouldHideNavigationBar
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // hide navigation bar if visible
        if shouldHideNavigationBar != navigationController?.navigationBar.isHidden ?? false {
            shouldHideNavigationBar = _shouldHideNavigationBar;
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

