//
//  UserViewController.swift
//  Networking
//
//  Created by Belmin Salkica on 10/18/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var suiteTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var catchPhraseTextField: UITextField!
    @IBOutlet weak var bsTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Functions
    func alert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func saveUsers() {
        var newUserId = 0
        if let lastUser = Users.shared.users.last?.id {
            newUserId += lastUser
        }
        
        let geo = Geo(lat: latitudeTextField.text!, lng: longitudeTextField.text!)
        
        let adress = Adress(street: streetTextField.text!, suite: suiteTextField.text!, city: cityTextField.text!, zipcode: zipCodeTextField.text!, geo: geo )
        
        let company = Company(name: companyNameTextField.text!, catchPhrase: catchPhraseTextField.text!, bs: bsTextField.text!)
        
        let user = User(id: newUserId, name: nameTextField.text!, username: userNameTextField.text!, email: emailTextField.text!, address: adress , phone: phoneTextField.text!, website: websiteTextField.text!, company: company)
        
        Users.shared.users.insert(user, atIndex: 0)
        
        navigationController?.popViewControllerAnimated(true)
    }
    func checkValidInput() {
        if nameTextField.text?.isEmpty ?? true {
            alert("You didn't enter your name")
        }
        if emailTextField.text?.isEmpty ?? true {
            alert("You didn't enter your email")
        } else {
            saveUsers()
        }
    }
    // MARK: Actions
    @IBAction func saveUser(sender: UIBarButtonItem) {
        checkValidInput()
    }
    
}
