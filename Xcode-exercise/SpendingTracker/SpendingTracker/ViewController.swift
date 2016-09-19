//
//  SpendingViewController.swift
//  SpendingTracker
//
//  Created by Belmin Salkica on 9/6/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    
    // Text fields
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // Button
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var spent: Spending?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable save button if amount text field is valid
        checkValidAmountName()
        
        // Handle user inputs through delegate callbacks - UITextFieldDelegate
        amountTextField.delegate = self
        
        prepareLayout()
        // Set up views if editing an existing Meal.
        
        if let spent = spent {
            navigationItem.title = String(spent.amountSpent)
            amountTextField.text = String(spent.amountSpent)
            descriptionTextView.text = spent.descriptionOfSpending
            dateTextField.text = spent.dateOfSpending
        }
        // Done button on
        self.addDoneButtonOnKeyboard()
    }
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidAmountName()
        navigationItem.title = textField.text
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    func checkValidAmountName() {
        let text = amountTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    // MARK: Functions
    func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    // Done button on numpad and date picker
    func addDoneButtonOnKeyboard() {
        // Add toolbar
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.Default
        // Space between items
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        // Done button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        // Spacing
        items.append(flexSpace)
        // Append done button on the right
        items.append(doneButton)
        
        doneToolbar.setItems([flexSpace, doneButton], animated: true)
        doneToolbar.userInteractionEnabled = true
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        // Done button on amount text field
        self.amountTextField.inputAccessoryView = doneToolbar
        // Done button on date text field
        self.dateTextField.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        // Hide keyboard when done button is tapped
        self.amountTextField.resignFirstResponder()
        self.dateTextField.resignFirstResponder()
    }
    // MARK: Navigation
    @IBAction func cancle(sender: UIBarButtonItem) {
        let isPresentingIntAddMealMode = presentingViewController is UINavigationController
        if isPresentingIntAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let amountSpent = Double(amountTextField.text ?? "0.00")!
            let description = descriptionTextView.text ?? ""
            let date = dateTextField.text ?? ""
            
            spent = Spending(amountSpent: amountSpent, descriptionOfSpending: description, dateOfSpending: date)
        }
    }
    
    // MARK: Actions
    @IBAction func textFieldEditing(sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }

    func prepareLayout() {
        let fieldBorderWidth: CGFloat = 1.0
        let fieldCornerRadius: CGFloat = 3.0
        let myColor = UIColor( red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0 )
        
        descriptionTextView.layer.borderColor = myColor.CGColor
        descriptionTextView.layer.borderWidth = fieldBorderWidth
        descriptionTextView.layer.cornerRadius = fieldCornerRadius
        
        dateTextField.layer.borderColor = myColor.CGColor
        dateTextField.layer.borderWidth = fieldBorderWidth
        dateTextField.layer.cornerRadius = fieldCornerRadius
        
        amountTextField.layer.borderColor = myColor.CGColor
        amountTextField.layer.borderWidth = fieldBorderWidth
        amountTextField.layer.cornerRadius = fieldCornerRadius
        
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        let strDate = dateFormatter.stringFromDate(currentDate)
        dateTextField.text = strDate
    }
    
    
}

