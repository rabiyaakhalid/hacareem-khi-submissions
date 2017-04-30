//
//  ArrivalTime.swift
//  Careem
//
//  Created by Rabiya  Khalid on 30/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArrivalTime{
    private var _productID: Int!
    private var _display_name: String!
    private var _eta: Int!
    
    var productID: Int{
        return _productID;
    }
    
    var display_name: String{
        return _display_name;
    }
    
    var eta: Int{
        return _eta;
    }
    
    init(id:Int!, data: JSON) {
            _productID = id
            
        if data["display_name"] != nil {
            _display_name = data["display_name"].string
        }else{
            _display_name = ""
        }
        if data["eta"] != nil {
            _eta = data["eta"].int
        }else{
            _eta = 0
        }
        


    
    
    }
    
    
    
}
