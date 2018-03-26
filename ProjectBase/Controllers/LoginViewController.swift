//
//  LoginController.swift
//  ProjectBase
//
//  Created by Motivator on 24/01/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    //MARK: - Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        designView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    //MARK: - Private
    
    private func designView() {
        
        shouldHideNavigationBar = true
        view.backgroundColor = AppColor.appBackgroundColor
        
    }
    
    
    //MARK: - Method
    
    
    //MARK: - IBAction
    
    @IBAction func login(_ sender: Any) {
        showWaitView(text: "Login... Please wait", view: view)
        UserCoordinator.validateUser(username: txtUsername.text!, password: txtPassword.text!, completion: { (user) in
            print("response \(user)")
            self.hideWaitView(view: self.view)
            showHomeScreen()
            
        }, failer: { (error) in
            print("response \(error)")
        })
    }
    
}
