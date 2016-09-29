//
//  KontaktTableViewController.swift
//  Dopuna
//
//  Created by Belmin Salkica on 9/20/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit
// MARK: Protocols
protocol ContactSelectedDelegate {
    func selectedContact(contact: Kontakt)
}

class KontaktTableViewController: UITableViewController {
    
    // MARK: Delegate
    var delegate: ContactSelectedDelegate?
    
    // MARK: Properties
    var kontakti = [Kontakt]()
    var selectedContactRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add edit button to navigation.
        let editItem = editButtonItem()
        navigationItem.rightBarButtonItems?.append(editItem)
        
        // Load contacts
        if let savedContacts = loadContacts() {
            kontakti += savedContacts
        } else {
            // Load sample contacts
            loadSampleContacts()
        }
    }
    // Load sample contacts
    func loadSampleContacts () {
        let kontakt1 = Kontakt(name: "Damir", phoneNumber: "060 309 1765")
        let kontakt2 = Kontakt(name: "Rijad", phoneNumber: "061 990 416")
        let kontakt3 = Kontakt(name: "Alem", phoneNumber: "061 302 303")
        
        // Add contacts to array
        if let kontakt1 = kontakt1 {
            kontakti.append(kontakt1)
        }
        if let kontakt2 = kontakt2 {
            kontakti.append(kontakt2)
        }
        if let kontakt3 = kontakt3  {
            kontakti.append(kontakt3)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kontakti.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cell identifier
        let cellIdentifier = "KontaktTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! KontaktTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let kontakt = kontakti[indexPath.row]
        
        // Configure cell
        if kontakt.name?.isEmpty == true {
            cell.imeKontakta.text = Kontakt.internationalPrefixNumber + kontakt.phoneNumber
            cell.brojKontakta.text = ""
        } else {
            cell.imeKontakta.text = kontakt.name
            cell.brojKontakta.text = Kontakt.internationalPrefixNumber + kontakt.phoneNumber
        }
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            kontakti.removeAtIndex(indexPath.row)
            // Save contacts after deleting it from the list
            saveContacts()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    }
    
    // Override to support selecting cells with chekcmark
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .Checkmark
            delegate?.selectedContact(kontakti[indexPath.row])
            _ = self.navigationController?.popViewControllerAnimated(true)
            
        }
    }
    // Override to support selecting cells with chekcmark
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath){
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
        }
    }
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NoviKontakt" {
            // Back bar button item
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        }
    }
    @IBAction func unwindToContactList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? NoviKontaktViewController, contact = sourceViewController.contact {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an exiting contact
                kontakti[selectedIndexPath.row] = contact
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // Add new contact
                let newIndexPath = NSIndexPath(forRow: kontakti.count, inSection: 0)
                kontakti.append(contact)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            // Save contacts
            saveContacts()
        }
    }
    // MARK: NSCoding
    func saveContacts() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(kontakti, toFile: Kontakt.archiveUrl.path!)
        if !isSuccessfulSave {
            print("Failed to save data")
        }
    }
    func loadContacts () -> [Kontakt]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Kontakt.archiveUrl.path!) as? [Kontakt]
    }
}