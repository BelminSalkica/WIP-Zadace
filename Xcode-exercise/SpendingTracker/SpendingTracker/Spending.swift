//
//  Spending.swift
//  SpendingTracker
//
//  Created by Belmin Salkica on 9/7/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Spending: NSObject, NSCoding {
    
    // MARK: Properties
    
    var amountSpent: Double
    var descriptionOfSpending: String?
    var dateOfSpending: String
    // Assuming that currency is in $$$
    let currency = "$"
    
    // MARK: Archiving Paths
    static let documentDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let archiveUrl = documentDirectory.URLByAppendingPathComponent("spending")
    
    // MARK: Initialization
    init?(amountSpent: Double, descriptionOfSpending: String?, dateOfSpending: String) {
        // Initialization should fail if amount spent is negative and description is empty
        if (amountSpent < 0) {
            return nil
        }
        
        // Initialization of custom properties.
        self.amountSpent = amountSpent
        self.descriptionOfSpending = descriptionOfSpending
        self.dateOfSpending = dateOfSpending
        
        super.init()
    }
    
    // MARK: Types
    struct PropertyKey {
        static let spentKey = "name"
        static let descriptionKey = "description"
        static let dateKey = "date"
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(amountSpent, forKey: PropertyKey.spentKey)
        aCoder.encodeObject(descriptionOfSpending, forKey: PropertyKey.descriptionKey)
        aCoder.encodeObject(dateOfSpending, forKey: PropertyKey.dateKey)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let amount = aDecoder.decodeObjectForKey(PropertyKey.spentKey) as! Double
        let description = aDecoder.decodeObjectForKey(PropertyKey.descriptionKey) as! String
        let date = aDecoder.decodeObjectForKey(PropertyKey.dateKey) as! String
        
        self.init(amountSpent: amount, descriptionOfSpending: description, dateOfSpending: date)
    }
}