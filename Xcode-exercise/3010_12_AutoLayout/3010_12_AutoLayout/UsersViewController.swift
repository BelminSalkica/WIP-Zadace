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
        ServerCommunication.shared.requestUsers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(UsersViewController.refreshData), name: NSNotification.Name(rawValue: "UsersRefreshed"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: Actions
    @IBAction func sendRequestForUsers(_ sender: UIBarButtonItem) {
        ServerCommunication.shared.requestUsers()
    }
    
    // MARK: Functions
    func displayUser() {
        performSegue(withIdentifier: "UserViewController", sender: self)
    }
    func refreshData() {
        users = Users.shared.users
        tableView.reloadData()
    }
    func startLocationMonitornig() {
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    func showUserLocation(user: User) {
        Users.shared.user = user
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
        if let firstUser = users.first {
            showUserLocation(user: firstUser)
        }
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)

    }    
}
// MARK: UsersViewController 
extension UsersViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
}
// MARK: Location Manager delegate methods
extension UsersViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
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
        
        let detailButton = UIButton(type: .detailDisclosure)
        detailButton.addTarget(self, action: #selector(UsersViewController.displayUser), for: .touchUpInside)
        annotationView.rightCalloutAccessoryView = detailButton
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
