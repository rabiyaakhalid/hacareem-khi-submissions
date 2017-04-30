//
//  BookingCreate.swift
//  Careem
//
//  Created by Rabiya  Khalid on 30/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//

import Foundation
import SwiftyJSON
class BookingCreate{
    private var _booking_Id: Int!
    private var _surge_multiplier: Int!
    
    var booking_Id: Int{
        return _booking_Id
    }
    var surge_multiplier:Int{
        return _surge_multiplier
    }
    

    init(id:Int!, data: JSON) {
        _booking_Id = id
        if data["surge_multiplier"] != nil {
            _surge_multiplier = data["surge_multiplier"].int
        }else{
            _surge_multiplier = 0
        }
    }

    
    
}
