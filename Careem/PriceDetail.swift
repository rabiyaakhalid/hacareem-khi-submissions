//
//  PriceDetail.swift
//  Careem
//
//  Created by Rabiya  Khalid on 29/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//

import Foundation
import SwiftyJSON

class PriceDetail{
    
    private var _base_now: Int!
    private var _product_Id: Int!
    private var _base_later: Int!
    private var _cost_per_distance: Int!
    private var _distance_unit: String!
    private var _currency_code: String!
    private var _minimum_now: Int!
    private var _minimum_later: Int!
    private var _cost_per_minute: Int!
    private var _cancellation_fee_later: Int!
    private var _cancellation_fee_now: Int!
    

    var product_Id:Int {
        return _product_Id;
    }
    var base_now: Int{
        return _base_now;
    }
    var base_later: Int{
        return _base_later;
    }
    var cost_per_distance: Int{
        return _cost_per_distance;
    }
    var distance_unit: String{
        return _distance_unit;
    }
    var currency_code: String{
        return _currency_code;
    }
    var minimum_now: Int{
        return _minimum_now;
    }
    var minimum_later: Int{
        return _minimum_later;
    }
    var cost_per_minute: Int{
        return _cost_per_minute;
    }
    var cancellation_fee_later: Int{
        return _minimum_later;
    }
    var cancellation_fee_now: Int{
        return _cost_per_minute;
    }
    
    init(id:Int!, data: JSON) {
        
        _product_Id = id
        
        if data["base_now"] != nil {
            _base_now = data["base_now"].int
        }else{
            _base_now = 0
        }
        
        if data["base_later"] != nil {
            _base_later = data["base_later"].int
        }else{
            _base_later = 0
        }
        
        if data["cost_per_distance"] != nil {
            _cost_per_distance = data["cost_per_distance"].int
        }else{
            _cost_per_distance = 0
        }
        if data["distance_unit"] != nil {
            _distance_unit = data["distance_unit"].string
        }else{
            _distance_unit = ""
        }
        if data["currency_code"] != nil {
            _currency_code = data["currency_code"].string
        }else{
            _currency_code = ""
        }
        if data["minimum_now"] != nil {
            _minimum_now = data["minimum_now"].int
        }else{
            _minimum_now = 0
        }
        if data["minimum_later"] != nil {
            _minimum_later = data["minimum_later"].int
        }else{
            _minimum_later = 0
        }
        if data["cost_per_minute"] != nil {
            _cost_per_minute = data["cost_per_minute"].int
        }else{
            _cost_per_minute = 0
        }
        if data["cancellation_fee_later"] != nil {
            _cancellation_fee_later = data["cancellation_fee_later"].int
        }else{
            _cancellation_fee_later = 0
        }
        if data["cancellation_fee_now"] != nil {
            _cancellation_fee_now = data["cancellation_fee_now"].int
        }else{
            _cancellation_fee_now = 0
        }
        
        
    }

    
    
    
}

