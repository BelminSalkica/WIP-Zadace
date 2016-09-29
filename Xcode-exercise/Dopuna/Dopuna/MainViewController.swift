//
//  MainViewController.swift
//  Dopuna
//
//  Created by Belmin Salkica on 9/20/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit
import MessageUI

class MainViewController: UIViewController, UINavigationControllerDelegate, ContactSelectedDelegate, MFMessageComposeViewControllerDelegate {
    // MARK: Properties
    var selectedKontakt: Kontakt?
    
    // Info for mTel users
    let mTel = "0651110"
    let mTelPrefix = "D"
    let mTelArry = [2, 3, 4, 5, 10]
    
    // Info for BHT users
    let bht = "0611171"
    let bhtPrefix = ""
    let bhtArray = [1, 2, 5, 10, 20]
    
    var vrstaDopuneIndex = 0
    var kolicinaDopune = 0
    
    // Segmented control
    @IBOutlet weak var vrstaDopune: UISegmentedControl!
    @IBOutlet weak var kolicinaDopuneMtel: UISegmentedControl!
    @IBOutlet weak var kolicinaDopuneBht: UISegmentedControl!
    
    // Buttons
    @IBOutlet weak var dodajKontakt: UIButton!
    @IBOutlet weak var dopuniRacun: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide BH T segmented control
        kolicinaDopuneBht.hidden = true
        navigationItem.title = "DOPUNA"
        
        // Prepare screen
        prepareScreen()
    }
    
    // MARK: Actions
    @IBAction func vrstaDopuneAkcija(sender: UISegmentedControl) {
        vrstaDopuneIndex = sender.selectedSegmentIndex
        
        switch sender.selectedSegmentIndex {
        case 0:
            kolicinaDopuneBht.hidden = true
            kolicinaDopuneMtel.hidden = false
            vrstaDopuneIndex = kolicinaDopuneMtel.selectedSegmentIndex
        case 1:
            kolicinaDopuneMtel.hidden = true
            kolicinaDopuneBht.hidden = false
            vrstaDopuneIndex = kolicinaDopuneBht.selectedSegmentIndex
        default:
            break
        }
    }
    @IBAction func kolicinaDopuneBht(sender: UISegmentedControl) {
        kolicinaDopune = sender.selectedSegmentIndex
    }
    @IBAction func kolicinaDopuneMtel(sender: UISegmentedControl) {
        kolicinaDopune = sender.selectedSegmentIndex
    }
    
    @IBAction func sendMessage(sender: UIButton) {
        if selectedKontakt != nil {
            if !MFMessageComposeViewController.canSendText() {
                print("Ovaj uređaj ne može poslati poruku")
            } else {
                var messageBody = ""
                let messageRecipient = Kontakt.internationalPrefixNumber + (selectedKontakt?.phoneNumber)!
                switch vrstaDopuneIndex {
                case 0:
                    messageBody += mTelPrefix
                    messageBody += String(mTelArry[kolicinaDopune])
                    messageBody += " \(mTel)"
                case 1:
                    messageBody += bhtPrefix
                    messageBody += String(bhtArray[kolicinaDopune])
                    messageBody += " \(bht)"
                default:
                    break
                }
                print(messageBody + " for recipient " + messageRecipient)
                
                let composeVC = MFMessageComposeViewController()
                composeVC.delegate = self
                composeVC.recipients = [messageRecipient]
                composeVC.body = messageBody
                
                self.presentViewController(composeVC, animated: true, completion: nil)
            }
        } else {
            alertMessage()
        }
    }
    
    // MARK: Functions
    func buttonLayout (button: UIButton, color: UIColor, radius: CGFloat, borderWidth: CGFloat ) {
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = radius
        button.layer.borderWidth = borderWidth
        
        button.layer.borderColor = color.CGColor
        button.tintColor = color
    }
    func segmentedControlLayout (segmented: UISegmentedControl, color: UIColor, radius: CGFloat, borderWidth: CGFloat) {
        segmented.layer.borderColor = color.CGColor
        segmented.tintColor = color
    }
    func prepareScreen () {
        // My color
        let myColor = Kontakt.myColor
        
        // Button layout
        buttonLayout(dodajKontakt, color: myColor, radius: 5, borderWidth: 1)
        buttonLayout(dopuniRacun, color: myColor, radius: 5, borderWidth: 1)
        
        // Segmented control layout
        segmentedControlLayout(vrstaDopune, color: myColor, radius: 5, borderWidth: 1)
        segmentedControlLayout(kolicinaDopuneMtel, color: myColor, radius: 5, borderWidth: 1)
        segmentedControlLayout(kolicinaDopuneBht, color: myColor, radius: 5, borderWidth: 1)
    }
    // Selected contact
    func selectedContact(contact: Kontakt) {
        selectedKontakt = contact
        let selectedKontaktString: String
        let kontaktPhoneNumber = Kontakt.internationalPrefixNumber + (selectedKontakt?.phoneNumber)!
        
        if let contactName = selectedKontakt?.name where selectedKontakt?.name != "" {
            selectedKontaktString = contactName
        } else {
            selectedKontaktString = kontaktPhoneNumber
        }
        dodajKontakt.setTitle(selectedKontaktString, forState: .Normal)
    }
    // Alert
    func alertMessage() {
        let alertController = UIAlertController(title: "Napomena", message: "Odaberite kontakt.", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    // Prepare for segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mainView" {
            if let selectedContact = segue.destinationViewController as? KontaktTableViewController {
                selectedContact.delegate = self
                
                // Back bar button item
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

