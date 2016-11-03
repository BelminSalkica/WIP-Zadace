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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.LightGrey()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: Extension UIColor
extension UIColor {
    class func LightGrey() -> UIColor {
        return UIColor(hue: 0.66, saturation: 0, brightness: 0.95, alpha: 1.0)
    }
}
