//
//  LocationManager.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation
import MapKit

final class LocationManager {
    
    static let shared = LocationManager()
    
    func getLocationManager () -> CLLocationManager {
        if locationManager == nil {
            locationManager = CLLocationManager()
            locationManager?.pausesLocationUpdatesAutomatically = true
        }
        return locationManager ?? CLLocationManager()
    }
    
    private var locationManager: CLLocationManager? = nil
    
    private init() {
    }
    
}
