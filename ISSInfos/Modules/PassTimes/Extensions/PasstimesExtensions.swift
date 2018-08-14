//
//  PasstimesExtensions.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation
import MapKit

extension PassTimes: CLLocationManagerDelegate {
    
    func setLocationManager() {
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.requestLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            sendToLocationSettings()
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordiantes = locations.last
        if let coordiantes = coordiantes {
            self.currentLocation = coordiantes
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.requestLocation()
        }
    }
    
    func sendToLocationSettings() {
        self.showTwoActionsAlert(title: NSLocalizedString("Acces to location Denied", comment: ""), message: NSLocalizedString("allow location access message", comment: ""), cancelTitle: NSLocalizedString("Cancel", comment: ""), okTitle: NSLocalizedString("allow location access", comment: ""), cancelHandler: { (action) in
        }, okHandler: { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                
                UIApplication.shared.open(url, completionHandler: { /*[weak self]*/ (completed) in
                    /*self?.dismiss(animated: true, completion: {
                     //self?.locationManager.startUpdatingLocation()
                     //self?.locationManager.requestLocation()
                     })*/
                })
                
            }
        })
    }
}

extension PassTimes: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passtimesResponse?.response.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let passtimes = passtimesResponse?.response, passtimes.count > indexPath.row {
            cell.textLabel?.text = getDateFromTimestamp(passtimes[indexPath.row].risetime)
            cell.detailTextLabel?.text = "\(passtimes[indexPath.row].duration)s"
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
