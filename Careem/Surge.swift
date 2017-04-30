//
//  Surge.swift
//  Careem
//
//  Created by Rabiya  Khalid on 30/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//

import Foundation
import SwiftyJSON

class Surge{
    private var _token : String!
    private var _product_Id:Int!
    private var _multiplier: Int!
    private var _expiry_in_minutes: Int!
    
    var product_Id: Int{
        return _product_Id;
    }
    var token:String{
        return _token;
    }
    var multiplier: Int{
        return _multiplier
    }
    var expiry_in_minutes: Int{
        return _expiry_in_minutes
    }
    
    init(id:Int!, data: JSON) {
        _product_Id = id
        if data["token"] != nil {
            _token = data["token"].string
        }else{
            _token = ""
        }
        if data["multiplier"] != nil {
            _multiplier = data["multiplier"].int
        }else{
            _multiplier = 0
        }
        if data["expiry_in_minutes"] != nil {
            _expiry_in_minutes = data["expiry_in_minutes"].int
        }else{
            _expiry_in_minutes = 0
        }
        

        

        
    }
    
}
