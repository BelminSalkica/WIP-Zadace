//
//  Geo.swift
//  1910_11_MapKit
//
//  Created by Belmin Salkica on 10/19/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Geo: NSObject {
    var lat: String?
    var lng: String?
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
    override init() {
        super.init()
    }
}
