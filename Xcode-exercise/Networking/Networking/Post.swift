//
//  Post.swift
//  Networking
//
//  Created by Belmin Salkica on 10/11/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Post: NSObject {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    override init(){
        super.init()
    }
}
