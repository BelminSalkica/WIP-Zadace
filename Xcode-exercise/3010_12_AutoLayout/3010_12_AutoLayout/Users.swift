//
//  Users.swift
//  3010_12_AutoLayout
//
//  Created by Belmin Salkica on 10/30/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Users: NSObject {
    static let shared = Users()
    
    var user = User()
    var users = [User]()
    
    private override init() {
        super.init()
    }
}
