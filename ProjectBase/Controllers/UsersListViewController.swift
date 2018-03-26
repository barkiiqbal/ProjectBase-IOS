//
//  UsersListViewController.swift
//  ProjectBase
//
//  Created by Motivator on 26/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit

class UsersListViewController: BaseViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblToken: UILabel!
    
    
    //MARK: - Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblUsername.text = UserSessionManager.shared().session!.username
        lblToken.text = UserSessionManager.shared().session!.token ?? "Not Found Error"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showToastMessage(text: "Welcome back!", view: view)
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

    
    // MARK: - IBAction
    
    @IBAction func logout(_ sender:Any) {
        
        print("logout from Applicaiton")
        let username = (UserSessionManager.shared().session?.username)!
        
        UserCoordinator.logout(username: username, completion: { (isDeleted) in
            
            showLoginScreen()
        }) {
            print("error deleting session")
        }
    }
}
