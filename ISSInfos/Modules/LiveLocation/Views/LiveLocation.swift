//
//  LiveLocation.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import UIKit
import MapKit

class LiveLocation: UIViewController {

    //MARK: outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews () {
        LiveLocationStore.getISSLiveLocation { [unowned self] location in
            self.showISSLocation("ISS location", latitude: Double(location?.location?.latitude ?? "") ?? 0, longitude: Double(location?.location?.longitude ?? "") ?? 0)
        }
    }

    func showISSLocation(_ title: String, latitude: Double, longitude: Double) {
        let center = CLLocation(latitude: latitude, longitude: longitude)
        let artwork = Artwork(title, coordinate: center.coordinate)
        mapView.showAnnotations([artwork], animated: true)
    }
}
