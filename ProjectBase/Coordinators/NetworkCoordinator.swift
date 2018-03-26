//
//  NetworkCoordinator.swift
//  ProjectBase
//
//  Created by Motivator on 23/01/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkCoordinator: NSObject {
    
    public enum RequestMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    
    
    //MARK: - Data response to SwiftJSON
    
    class func convertResponseToSwiftJson(dataResponse: DataResponse<Any>) -> JSON {
        
        var json: JSON
        do {
            json = try JSON(data: dataResponse.data!)
        } catch _ {
            json = JSON.null
        }
        return json
    }
    
    
    //MARK: - Request Methods
    
    class func doRequest(url:String, requestMethod:RequestMethod, param:[String:Any]? , header:[String:String]?, completion:@escaping (HTTPURLResponse?,JSON?,Error?) -> Void) {
        
        let method =  HTTPMethod.init(rawValue: requestMethod.rawValue)
        guard (method != nil) else {
            print("-------- Error, cannot convert RequestMethod to HTTPMethod");
            return;
        }
        
        let manager = UserSessionManager.shared().manager
        manager.request(url, method: method!, parameters: param, encoding: JSONEncoding.default , headers: header).responseJSON { (response) in
            
            switch response.result {
            case .success:
            
                if response.response?.statusCode == 403 {
                    DPrint("Sesstion expired \(url)")
                    NotificationCenter.default.post(name: NSNotification.Name.init("tokenExpired"), object: nil)
                    //                    completion(json,nil)
                    
                }
                let json = NetworkCoordinator.convertResponseToSwiftJson(dataResponse: response)
                completion(response.response,json,nil)
                
            case .failure(let error):
                completion(response.response,nil,error)
                
            }
        }
    }
    
    class func doRequestString(url:String, requestMethod:RequestMethod, param:[String:Any]?, header:[String:String],  completion:@escaping (HTTPURLResponse?,String?,Error?) -> Void) {
        let method =  HTTPMethod.init(rawValue: requestMethod.rawValue)
        
        guard (method != nil) else {
            print("-------- Error, cannot convert RequestMethod to HTTPMethod");
            return;
        }
        let manager = UserSessionManager.shared().manager
        manager.request(url, method: method!, parameters: param, encoding: JSONEncoding.default, headers: header).responseString(completionHandler:{ (response) in
            //            self.slideMenuController()?.openLeft()
            
            print(response)
            
            completion(response.response,(response.result as? String ?? "") ,nil)
        })
    }
    
    
    func doMultiPartFormRequest(url:String, requestMethod:RequestMethod, param:[String:Any], header:[String:String], completion:@escaping (JSON?,Error?) -> Void) {
        
        let method =  HTTPMethod.init(rawValue: requestMethod.rawValue)
        guard (method != nil) else {
            print("-------- Error, cannot convert RequestMethod to HTTPMethod");
            return;
        }
        
        let manager = UserSessionManager.shared().manager
        manager.upload(multipartFormData: { (formData) in
            
            //setting normal params
            for (key, value) in param {
                if value is String
                {
                    formData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                }
            }
            
            //setting data params
            for (key, value) in param {
                if value is UIImage
                {
                    let imageData = UIImageJPEGRepresentation(value as! UIImage,0.3)!
                    formData.append(imageData, withName: key, fileName: "myImage.png", mimeType: "image/png")
                    
                }
            }
            
        }, to: url,
           method: method!,
           headers: header,
           encodingCompletion: {
            (encodingResult) -> Void in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON{ response in
                    guard response.result.error == nil else {
                        print(upload.progress)
                        completion(nil, response.result.error)
                        return
                    }
                    
                    if let value = response.result.value
                    {
                        completion(JSON(value),nil)
                    }
                }
            case .failure(let error):
                completion(nil, error)
                break
            }
        })
    }
}
