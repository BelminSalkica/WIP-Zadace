//
//  Address.swift
//  1910_11_MapKit
//
//  Created by Belmin Salkica on 10/19/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Address: NSObject {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    
    init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    override init() {
        super.init()
    }
}
