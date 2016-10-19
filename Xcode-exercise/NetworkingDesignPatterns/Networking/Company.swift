//
//  Company.swift
//  Networking
//
//  Created by Belmin Salkica on 10/3/16.
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
