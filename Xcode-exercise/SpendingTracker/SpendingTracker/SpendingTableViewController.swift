//
//  SpendingTableViewController.swift
//  SpendingTracker
//
//  Created by Belmin Salkica on 9/7/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class SpendingTableViewController: UITableViewController {
    // MARK: Properties
    var expenses = [Spending]()
    
    var spent: Spending?
    // MARK: Functions
    func today() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .FullStyle
        dateFormatter.stringFromDate(NSDate())
    }
    // MARK: Functions
    func loadSampleData() {
        let item1 = Spending(amountSpent: 10.0, descriptionOfSpending: "Test test hehehe lorem ipsum", dateOfSpending: "Monday, July 9, 2011.04.05")
        let item2 = Spending(amountSpent: 40.0, descriptionOfSpending: "This is just a description", dateOfSpending: "Friday, Septembre 10, 2015.05.12")
        let item3 = Spending(amountSpent: 50.0, descriptionOfSpending: "This is just a description", dateOfSpending: "Wednesday, Janury 1, 2015.05.12")
        
        
        if let item1 = item1 {
            expenses.append(item1)
        }
        if let item2 = item2 {
            expenses.append(item2)
        }
        if let item3 = item3 {
            expenses.append(item3)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Edit
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load sample data
        if let savedSpendings = loadSpendings() {
            expenses += savedSpendings
        } else {
            loadSampleData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Cell Identifier
        let cellIdentifier = "SpendingTableViewCell"
        // Cell
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpendingTableViewCell
        
        let theExpenses = expenses[indexPath.row]
        
        // Configure the cell..
        cell.moneyLabel.text = theExpenses.currency + String(theExpenses.amountSpent)
        cell.dateLabel.text = theExpenses.dateOfSpending
        cell.descriptionLabel.text = theExpenses.descriptionOfSpending
        
        return cell
    }
    
    //     MARK: Navigation
    @IBAction func unwindToSpendingList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, expense = sourceViewController.spent {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                // Update an existing item
                expenses[selectedIndexPath.row] = expense
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // Add new item
                let newIndexPath = NSIndexPath(forRow: expenses.count, inSection: 0)
                expenses.append(expense)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            saveSpendings()
        }
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            expenses.removeAtIndex(indexPath.row)
            saveSpendings()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let  spendingDetailViewControler = segue.destinationViewController as! ViewController
            
            if let selectedSpendingCell = sender as? SpendingTableViewCell {
                if let indexPath = tableView.indexPathForCell(selectedSpendingCell) {
                    let selectedSpending = expenses[indexPath.row]
                    spendingDetailViewControler.spent = selectedSpending
                }
            }
        }
        if segue.identifier == "AddItem" {
            // Only for testing purposes
            print("Adding new item")
        }
    }
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    }
    
    // MARK: NSCoding
    func saveSpendings() {
        let succesSave = NSKeyedArchiver.archiveRootObject(expenses, toFile: Spending.archiveUrl.path!)
        if !succesSave {
            print("Failed to save")
        }
    }
    func loadSpendings() -> [Spending]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Spending.archiveUrl.path!) as? [Spending]
    }
}
