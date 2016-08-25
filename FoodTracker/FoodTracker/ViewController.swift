//
//  ViewController.swift
//  FoodTracker
//
//  Created by Belmin Salkica on 8/25/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle user inputs
        nameTextField.delegate = self
    }
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    // MARK: UIImagePickerControlerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismis the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide keyboard
        nameTextField.resignFirstResponder()
        
        // UIImage controler lets user to picke media from theri photo library
        let imagePickerControler = UIImagePickerController()
        
        // Let us select photos from Photo Library
        imagePickerControler.sourceType = .PhotoLibrary
        
        // Make sure that ViewControler knows when user select image
        imagePickerControler.delegate = self
        
        //
        presentViewController(imagePickerControler, animated: true, completion: nil)
    }
   
}

