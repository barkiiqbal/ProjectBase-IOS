//
//  ForgetPasswordViewController.swift
//  ProjectBase
//
//  Created by Motivator on 21/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var txtUsername: UITextField!
    
    //MARK: - Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    
    //MARK: - IBAction
    
    @IBAction func forgetPassword(_ sender: Any) {
        UserCoordinator.forgetPassword(username: txtUsername.text!, completion: { (user) in
            print("response \(user)")
        }, failer: { (error) in
            print("response \(error)")
        })
    }
}
