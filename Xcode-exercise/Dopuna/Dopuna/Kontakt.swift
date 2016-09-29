//
//  Kontakt.swift
//  Dopuna
//
//  Created by Belmin Salkica on 9/20/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Kontakt: NSObject, NSCoding {
    
    // MARK: Properties
    let name: String?
    let phoneNumber: String
    
    // Color
    static var myColor = UIColor(red: 0.18, green: 0.80, blue: 0.44, alpha: 1.0)
    
    // International prefix number
    static let internationalPrefixNumber = "+387"
    
    // MARK: Archiving Paths
    static let documentDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let archiveUrl = documentDirectory.URLByAppendingPathComponent("contacts")
    
    init?(name: String?, phoneNumber: String) {
        if phoneNumber.isEmpty == true {
            return nil
        }
        self.name = name
        self.phoneNumber = phoneNumber
        
        super.init()
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropetyKey.contactName)
        aCoder.encodeObject(phoneNumber, forKey: PropetyKey.contactNumber)
    }
    required convenience init? (coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropetyKey.contactName) as? String
        let number = aDecoder.decodeObjectForKey(PropetyKey.contactNumber) as! String
        
        // Designated init
        self.init(name: name, phoneNumber: number)
    }
}

// MARK: Types
struct PropetyKey {
    static let contactName = "name"
    static let contactNumber = "number"
}