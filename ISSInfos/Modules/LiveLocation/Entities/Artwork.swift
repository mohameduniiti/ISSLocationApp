//
//  Artwork.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation
import MapKit

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(_ title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
}
