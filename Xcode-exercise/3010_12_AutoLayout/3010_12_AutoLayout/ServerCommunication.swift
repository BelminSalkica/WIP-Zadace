//
//  ServerCommunication.swift
//  3010_12_AutoLayout
//
//  Created by Belmin Salkica on 10/30/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class ServerCommunication: NSObject {
    
    static let shared = ServerCommunication()
    
    private override init() {
        super.init()
    }
    
    func requestUsers() {
        let url = URL(string: "http://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    Users.shared.users = [User]()
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    
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
                            let address = Address()
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
                        Users.shared.users.append(user)
                    }
                    DispatchQueue.main.sync {
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UsersRefreshed"), object: nil)
                    }
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
}
