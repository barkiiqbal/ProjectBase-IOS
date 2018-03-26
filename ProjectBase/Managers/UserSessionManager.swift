//
//  UserHelper.swift
//  ProjectBase
//
//  Created by Motivator on 20/02/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation
import Locksmith
import Alamofire

struct Session: ReadableSecureStorable, CreateableSecureStorable, DeleteableSecureStorable, GenericPasswordSecureStorable {
    let service: String = "UserSessionDetail"
    let username: String
//    var password: String?
    var token:String?
    
    var account: String { return username }
    var data: [String: Any] {
        
//        guard let password = password else {
//            fatalError("Calling `createInSecureStore` without password is invalid.")
//        }
        
        guard let token = token else {
            fatalError("Calling `createInSecureStore` without token is invalid.")
        }
        
        return [//"password": password,
                "token": token] as [String: Any]
    }
    
    init?(username:String) {
        self.username = username
        guard let result = self.readFromSecureStore() else { return  }
        guard let keychainData = result.data else { return nil }
//      guard let password = keychainData["password"] as? String else { return nil }
        guard let token = keychainData["token"] as? String else { return nil }
//        self.password = password
        self.token = token
    }
}


class UserSessionManager: NSObject {
    
    public var session:Session?
    public var manager:SessionManager
    
    private static var sharedSessionManager: UserSessionManager = {
        let sessionManager = UserSessionManager()
        return sessionManager
    }()
    
    override init() {

        
        let configuration = URLSessionConfiguration.default
        self.manager = Alamofire.SessionManager(configuration: configuration)
//        var headers = Alamofire.SessionManager.defaultHTTPHeaders
//        self.manager.session.configuration.httpAdditionalHeaders = headers
        super.init()
        
        if let username = DefaultManager.get(key: kKeyUsername) {
           _ = loadSession(username: username)
        }
    }
    // MARK: - Accessors
    
    class func shared() -> UserSessionManager {
        return sharedSessionManager
    }

    
    //MARK: Session
    
    func saveSession(session:Session) -> Bool {
        do {
            try session.createInSecureStore()
            self.session = session
            DefaultManager.save(string: session.username, key: kKeyUsername)
            return true
        }
        catch LocksmithError.duplicate {
            print("Throws error duplicate")
            self.session = session
            DefaultManager.save(string: session.username, key: kKeyUsername)
            return true
        }
        catch {
            print("Throws error \(error)")
          
            return false
        }
    }
    
    func loadSession(username:String) -> Session? {
        
        let result = Session(username: username)
        self.session = result
        return session
    }
    
    func removeSessionValues(removeFromKeychain:Bool = true) -> Bool {
        
        do {
            try session?.deleteFromSecureStore()
            self.session = loadSession(username: session!.username)
            return true;
        }
        catch {
            print("Throws error \(error)")
            return false
        }
    }
    
    func isSessionAvailable() -> Bool {
        var isSessionAvailable = false
        if let session =  UserSessionManager.shared().session  {
            if session.token != nil {
                print("found Last Session for user = \(session.username)")
                isSessionAvailable = true
            }
        }
        return isSessionAvailable
    }
}
