 //
//  Meal.swift
//  FoodTracker
//
//  Created by Belmin Salkica on 8/25/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties 
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization 
    init?(name: String, photo: UIImage?, rating: Int) {
        // Return nill if there is no name and rating is less than 0
        if name.isEmpty || rating < 0 {
            return nil
        }
        // Initializing stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
