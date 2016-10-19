//
//  PostsTableViewController.swift
//  Networking
//
//  Created by Belmin Salkica on 10/11/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    // MARK: Properties
    var posts = [Post]()
    var userPostId = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUsersPosts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "PostsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Fetch apropriate post for data source layout
        let post = posts[indexPath.row]
        // Configure cell
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
    
    // MARK: Functions
    func loadUsersPosts() {
        let url = NSURL(string: "http://jsonplaceholder.typicode.com/posts?userId=\(userPostId)")!
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! [[String: AnyObject]]
                    
                    // Clean posts array before iteration starts
                    self.posts = [Post]()
                    
                    for postObject in json {
                        
                        let post = Post()
                        
                        if let postId = postObject["id"] as? Int {
                            post.id = postId
                        }
                        if let postTitle = postObject["title"] as? String {
                            post.title = postTitle
                        }
                        if let postBody = postObject["body"] as? String {
                            post.body = postBody
                        }
                        self.posts.append(post)
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
