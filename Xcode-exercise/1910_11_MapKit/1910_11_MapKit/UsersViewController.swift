//
//  ViewController.swift
//  1910_11_MapKit
//
//  Created by Belmin Salkica on 10/19/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class UsersViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: Actions
    @IBAction func sendRequestForUsers(_ sender: UIBarButtonItem) {
        requestUsers()
    }
    
    // MARK: Functions
    func startLocationMonitornig() {
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    func showUserLocation(user: User) {
        var cordinate = CLLocationCoordinate2D()
        
        if let lat = user.address?.geo?.lat, let lng = user.address?.geo?.lng {
            let latitude: Double = (lat as NSString).doubleValue
            let longitude: Double = (lng as NSString).doubleValue
            
            cordinate.longitude = longitude
            cordinate.latitude = latitude
        }
        let span = MKCoordinateSpanMake(1, 1)
        let mapRegion = MKCoordinateRegionMake(cordinate, span)
        
        mapView.setRegion(mapRegion, animated: true)
    }
    func putUsersOnMap(user: User) {
        let annotation = MKPointAnnotation()
        var cordinate = CLLocationCoordinate2D()
        
        if let lat = user.address?.geo?.lat, let lng = user.address?.geo?.lng {
            let latitude: Double = (lat as NSString).doubleValue
            let longitude: Double = (lng as NSString).doubleValue
            
            cordinate.longitude = longitude
            cordinate.latitude = latitude
        }
        annotation.coordinate = cordinate
        
        if let name = user.name {
            annotation.title = name
        }
        
        var subtitle = ""
        if let city = user.address?.city {
            subtitle += city + " "
        }
        if let street = user.address?.street {
            subtitle += street
        }
        annotation.subtitle = subtitle
        
        mapView.addAnnotation(annotation)

    }
    func requestUsers() {
        let url = URL(string: "http://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
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
                        self.users.append(user)
                    }
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
}

// MARK: Location Manager delegate methods
extension UsersViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("User did enter \(region.identifier)")
    }
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Monitoring failed with error: \(error.localizedDescription)")
    }
}

// MARK: Map View delegate methods
extension UsersViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
        annotationView.canShowCallout = true
        return annotationView
    }
}

// MARK: Table View delegate methods
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let user = users[indexPath.row]
        
        for user in users {
            putUsersOnMap(user: user)
        }
        
        if let firstUser = users.first {
            showUserLocation(user: firstUser)
        }
        
        cell.textLabel?.text = user.name
        
        if let userAdress = user.address {
            var detailText = ""
            if let userAddressCity = userAdress.city {
                detailText += userAddressCity + " "
            }
            if let userAddressStreet = user.address?.street {
                detailText += userAddressStreet
            }
            cell.detailTextLabel?.text = detailText
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        showUserLocation(user: user)
    }
}
