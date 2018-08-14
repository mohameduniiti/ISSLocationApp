//
//  PassTimes.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import UIKit
import MapKit

class PassTimes: UIViewController {
    
    //MARK: outlets
    @IBOutlet weak var passtimesTableView: UITableView!
    
    //MARK: vars
    var passtimesResponse: PasstimesResponse?
    // user location vars
    let locationManager = LocationManager.shared.getLocationManager()
    var currentLocation: CLLocation? = nil {
        didSet {
            getPassTimes(latitude: currentLocation?.coordinate.latitude ?? 0, longitude: currentLocation?.coordinate.longitude ?? 0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            checkForLocationAuthorization()
        }
    }
    
    func setUpViews() {
        passtimesTableView.delegate = self
        passtimesTableView.dataSource = self
    }

    // Geoloc methods
    func checkForLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            setLocationManager()
        }
    }
    
    func getPassTimes(latitude: Double, longitude: Double) {
        PasstimesStore.getPasstimes(userLat: latitude, userLng: longitude) { [unowned self] passtimes in
            self.passtimesResponse = passtimes
            self.passtimesTableView.reloadData()
        }
    }
}
