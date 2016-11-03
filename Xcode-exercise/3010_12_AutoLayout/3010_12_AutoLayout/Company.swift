//
//  Company.swift
//  1910_11_MapKit
//
//  Created by Belmin Salkica on 10/19/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Company: NSObject {
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    override init() {
        super.init()
    }
}
