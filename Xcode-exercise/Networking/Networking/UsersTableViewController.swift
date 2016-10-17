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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        if let userAdress = user.address?.street {
            cell.detailTextLabel!.text = userAdress
        }
        
        return cell
    }
  
    // MARK: Prepare for segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PostsTvc" {
            
            // Destionation tableViewController
            let userPostTableViewController = segue.destinationViewController as! PostsTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectedUser = users[(indexPath?.row)!]
            
            if let selectedUserId = selectedUser.id {
                userPostTableViewController.userPostId = selectedUserId
            }
        }
    }
    
    // MARK: Actions
    @IBAction func sendRequestForUsers(sender: UIBarButtonItem) {
        getUsers()
    }
    
    // MARK: Functions
    func getUsers () {
        let url = NSURL(string: "http://jsonplaceholder.typicode.com/users")!
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! [[String: AnyObject]]
                    // Clean user array before iteration starts
                    self.users = [User]()
                    
                    for userObject in json {
                        // Creating user object
                        let user = User()
                        // Parsing data to user object
                        if let id = userObject["id"] as? Int {
                            user.id = id
                        }
                        if let name = userObject["name"] as? String {
                            user.name = name
                        }
                        if let userName = userObject["username"] as? String {
                            user.username = userName
                        }
                        if let email = userObject["email"] as? String {
                            user.email = email
                        }
                        if let adressObject = userObject["address"] as? [String: AnyObject] {
                            // Creating address object
                            let address = Adress()
                            user.address = address
                            
                            if let street = adressObject["street"] as? String {
                                address.street = street
                            }
                            if let suite = adressObject["suite"] as? String {
                                address.suite = suite
                            }
                            if let city = adressObject["city"] as? String {
                                address.city = city
                            }
                            if let zipcode = adressObject["zipcode"] as? String {
                                address.zipcode = zipcode
                            }
                            if let geoObject = adressObject["geo"] as? [String: AnyObject] {
                                // Creating geo object
                                let geo = Geo()
                                user.address?.geo = geo
                                
                                if let lat = geoObject["lat"] as? String {
                                    geo.lat = lat
                                }
                                if let lng = geoObject["lng"] as? String {
                                    geo.lng = lng
                                }
                            }
                            if let phone = userObject["phone"] as? String {
                                user.phone = phone
                            }
                            if let website = userObject["website"] as? String {
                                user.website = website
                            }
                            if let companyObject = userObject["company"] as? [String: AnyObject] {
                                // Creating company object
                                let company = Company()
                                user.company = company
                                
                                if let name = companyObject["name"] as? String {
                                    company.name = name
                                }
                                if let catchPhrase = companyObject["catchPhrase"] as? String {
                                    company.catchPhrase = catchPhrase
                                }
                                if let bs = companyObject["bs"] as? String {
                                    company.bs = bs
                                }
                            }
                        }
                        self.users.append(user)
                    }
                    // We use dispatch async and queue type user initiated
                    dispatch_sync(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)) {
                        dispatch_sync(dispatch_get_main_queue()) {
                            self.tableView.reloadData()
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
