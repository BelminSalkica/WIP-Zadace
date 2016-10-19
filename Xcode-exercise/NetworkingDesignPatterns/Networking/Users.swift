//
//  Users.swift
//  Networking
//
//  Created by Belmin Salkica on 10/18/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Users: NSObject {
    
    static let shared = Users()
    
    var users = [User]()
    
    private override init() {
        super.init()
    }
}
