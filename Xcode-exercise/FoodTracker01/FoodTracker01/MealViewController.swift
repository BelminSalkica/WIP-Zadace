//
//  MealViewController.swift
//  FoodTracker01
//
//  Created by Belmin Salkica on 9/1/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle user inputs
        nameTextField.delegate = self
        
        // Set up views if editing an existing Meal. 
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Enable save button only if there is valid meal name.
        checkValidName()
    }
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    func checkValidName() {
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidName()
        navigationItem.title = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // Take the Orginal image from library
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Present pho  to to view
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    // MARK: Navigation
    
    @IBAction func cancle(sender: UIBarButtonItem) {
        // Depending on style of presentation this view needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide keyboard 
        nameTextField.resignFirstResponder()
        
        // Select image fron photo library
        let imagePickerController = UIImagePickerController()
        
        // Only allow to select from photo library
        imagePickerController.sourceType = .PhotoLibrary
        
        // Notify viewcontroller when user picks image
        imagePickerController.delegate = self
        
        // Animations
        presentViewController(imagePickerController, animated: true, completion: nil)
        
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

