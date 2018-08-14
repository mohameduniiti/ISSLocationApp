//
//  ISSPassenger.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation

struct ISSPassenger: Codable {
    var name: String
    var craft: String
}

struct ISSPassengers: Codable {
    var message: String
    var number: Int
    var people: [ISSPassenger]
}
