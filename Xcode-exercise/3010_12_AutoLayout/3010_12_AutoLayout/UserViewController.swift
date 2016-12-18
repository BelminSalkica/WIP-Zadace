//
//  UserViewController.swift
//  3010_12_AutoLayout
//
//  Created by Belmin Salkica on 10/30/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var mainName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    let test: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.LightGrey()
        
        displayUser(user: Users.shared.user)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: Functions
    func displayUser(user: User) {
        if let name = user.name {
            mainName.text = name
            nameLabel.text = name
        }
        if let userName = user.username {
            usernameLabel.text = userName
        }
        if let email = user.email {
            emailLabel.text = email
        }
        var addres = ""
        if let city = user.address?.city {
            addres += city + " "
        }
        if let street = user.address?.street {
            addres += street
        }
        addressLabel.text = addres
        
        if let phone = user.phone {
            phoneLabel.text = phone
        }
        if let website = user.website {
            websiteLabel.text = website
        }
        if let company = user.company?.name {
            companyLabel.text = company
        }
    }
}

// MARK: Extension UIColor
extension UIColor {
    class func LightGrey() -> UIColor {
        return UIColor(hue: 0.66, saturation: 0, brightness: 0.95, alpha: 1.0)
    }
}
