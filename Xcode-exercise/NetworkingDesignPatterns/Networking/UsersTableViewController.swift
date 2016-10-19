//
//  UsersTableViewController.swift
//  Networking
//
//  Created by Belmin Salkica on 10/3/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    // MARK: Properties
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load users to singlton
        ServerCommunication.shared.refreshUsers()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UsersTableViewController.refreshData), name: "UsersRefreshed", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Functions
    func refreshData() {
        users = Users.shared.users
        tableView.reloadData()
    }
    
    // MARK: Actions
    @IBAction func sendRequestForUsers(sender: UIBarButtonItem) {
        ServerCommunication.shared.refreshUsers()
    }
}

extension UsersTableViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "UsersTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Fetch apropriate user for data source layout.
        let user = users[indexPath.row]
        
        // Configure cell
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
}
