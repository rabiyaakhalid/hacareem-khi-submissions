//
//  EstimateTripFareTimeAndDistance.swift
//  Careem
//
//  Created by Rabiya  Khalid on 30/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//

import Foundation
import SwiftyJSON
class EstimateTripFareTimeAndDistance{
    private var _product_Id: Int!
    private var _duration: Int!
    private var _distance: Int!
    private var _currency_code: String!
    private var _estimate: String!
    private var _low_estimate: Int!
    private var _high_estimate: Int!
    private var _metric: String!
    
    private var _surge_model:[String:JSON]?
    
    var product_Id: Int{
        return _product_Id;
    }
    var duration: Int{
        return _duration;
    }
    var distance: Int{
        return _distance;
    }
    var currency_code: String{
        return _currency_code;
    }
    var estimate:String{
        return _estimate;
    }
    var low_estimate:Int {
        return _low_estimate;
    }
    var high_estimate: Int{
        return _high_estimate;
    }
    var metric: String{
        return _metric;
    }
    var surge_model: [String:Any]{
        return _surge_model!;
    }
    init(id:Int!, data: JSON) {
        _product_Id = id
        
        if data["duration"] != nil {
            _duration = data["duration"].int
        }else{
            _duration = 0
        }
        if data["distance"] != nil {
            _distance = data["distance"].int
        }else{
            _distance = 0
        }
        if data["currency_code"] != nil {
            _currency_code = data["currency_code"].string
        }else{
            _currency_code = ""
        }
        if data["estimate"] != nil {
            _estimate = data["estimate"].string
        }else{
            _estimate = ""
        }
        if data["low_estimate"] != nil {
            _low_estimate = data["low_estimate"].int
        }else{
            _low_estimate = 0
        }
        if data["high_estimate"] != nil {
            _high_estimate = data["high_estimate"].int
        }else{
            _high_estimate = 0
        }
        if data["metric"] != nil {
            _metric = data["metric"].string
        }else{
            _metric = ""
        }
        if let surge_model = data["surge"].dictionary{
            _surge_model = surge_model
        }
        
        

        
        
    }

    
    
    
    
    
    
    
}
