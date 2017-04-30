//
//  CarType.swift
//  Careem
//
//  Created by Rabiya  Khalid on 29/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//

import Foundation
import SwiftyJSON

class CarType{
    private var _productId: Int!
    private var _capacity:Int!
    private var _display_order:Int!
    private var _display_name: String!
    private var _image: String!
    private var _availability_now: Bool!
    private var _availability_later: Bool!
    private var _min_time_to_book: Int!
    private var _max_time_to_cancel_now: Int!
    private var _max_time_to_cancel_later: Int!
    
    private var _priceDetail: [String:JSON]?
    
    var productID: Int{
        return _productId;
    }
    
    var capacity: Int{
        return _capacity;
    }
    
    var display_order: Int{
        return _display_order;
    }
    var display_name: String{
         return _display_name;
    }
    
    var image: String{
        return _image
    }
    var availability_now: Bool{
        return _availability_now;
    }
    var availability_later: Bool{
        return _availability_later;
    }
    var min_time_to_book: Int {
        return _min_time_to_book;
    }
    var max_time_to_cancel_now: Int{
        return _max_time_to_cancel_now;
    }
    var max_time_to_cancel_later: Int{
        return _max_time_to_cancel_later;
    }
    var priceDetail: [String:Any]{
        return _priceDetail!
    }
    
    init(id:Int!, data: JSON) {
        
        _productId = id
        
        if data["availibility_later"] != nil {
            _availability_later = data["availibility_later"].bool
        }else{
            _availability_later = false
        }
        
        if data["availibility_now"] != nil {
            _availability_now = data["availibility_now"].bool
        }else{
            _availability_now = false
        }
        
        if data["capacity"] != nil {
            _capacity = data["capacity"].int
        }else{
            _capacity = 0
        }
        
        if data["display_name"] != nil {
            _display_name = data["display_name"].string
        }else{
            _display_name = ""
        }
        
        if data["display_order"] != nil {
            _display_order = data["display_order"].int
        }else{
            _display_order = 0
        }
        
        if data["image"] != nil {
            _image = data["image"].string
        }else{
            _image = ""
        }
        
        if data["maximum_time_to_cancel_later"] != nil {
            _max_time_to_cancel_later = data["maximum_time_to_cancel_later"].int
        }else{
            _max_time_to_cancel_later = 0
        }
        
        if data["maximum_time_to_cancel_now"] != nil {
            _max_time_to_cancel_now = data["maximum_time_to_cancel_now"].int
        }else{
            _max_time_to_cancel_now = 0
        }
        
        if data["minimum_time_to_book"] != nil {
            _min_time_to_book = data["minimum_time_to_book"].int
        }else{
            _min_time_to_book = 0
        }
        
        if let pricedetail = data["price_details"].dictionary{
            _priceDetail = pricedetail
        }
        
        
    }

    
    
    
    
    
    
    
    
    
    
}
