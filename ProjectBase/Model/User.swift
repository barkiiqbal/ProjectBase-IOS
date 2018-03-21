//
//  User.swift
//  ProjectBase
//
//  Created by Motivator on 01/02/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable {
    
    var username: String?
    var age: Int?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        username    <- map["username"]
        age         <- map["age"]
    }
    

}
