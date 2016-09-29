//
//  NoviKontaktViewController.swift
//  Dopuna
//
//  Created by Belmin Salkica on 9/21/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class NoviKontaktViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var imeTextField: UITextField!
    @IBOutlet weak var brojTextField: UITextField!
    
    // Buttons
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIButton!
    
    // Add new contact
    var contact: Kontakt?
    
    // Color
    var myColor = Kontakt.myColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        imeTextField.delegate = self
        brojTextField.delegate = self
        
        // Set up views if editing an existing Contact.
        if let contact = contact {
            navigationItem.title = contact.name
            imeTextField.text = contact.name
            brojTextField.text = contact.phoneNumber
        }
        
        buttonLayout(saveButton, color: myColor, radius: 5, borderWidth: 1)
    }
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide keyboard
        if textField == imeTextField {
            textField.resignFirstResponder()
        }
        if textField == brojTextField{
            textField.resignFirstResponder()
        }
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == imeTextField {
            navigationItem.title = textField.text
        }
    }
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender || saveBarButton === sender {
            addNewContact()
        }
    }
    // MARK: Functions
    func alert() {
        let alert = UIAlertController(title: "Pažnja", message: "Obavezno je unijeti broj telefona", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func addNewContact () {
        if let number = brojTextField.text {
            if number.isEmpty {
                alert()
            }
            else if number.isEmpty != true {
                let name = imeTextField.text ?? ""
                let number = brojTextField.text!
                
                // Set new contact to be passed to KontaktTableViewController after the unwind segue.
                contact = Kontakt(name: name, phoneNumber: number)
                
                // Preform segue with identifier
                performSegueWithIdentifier("unwindToContactList", sender: self)
            }
        }
    }
    func buttonLayout (button: UIButton, color: UIColor, radius: CGFloat, borderWidth: CGFloat ) {
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = radius
        button.layer.borderWidth = borderWidth
        
        button.layer.borderColor = color.CGColor
        button.tintColor = color
    }
    // MARK: Actions
    @IBAction func cancle(sender: UIBarButtonItem) {
        let isPresentingInAddContactMode = presentingViewController is UINavigationController
        
        if isPresentingInAddContactMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    @IBAction func buttonPressed(sender: UIButton) {
        addNewContact()
    }
    @IBAction func barButtonPressed(sender: UIBarButtonItem) {
        addNewContact()
    }
}

