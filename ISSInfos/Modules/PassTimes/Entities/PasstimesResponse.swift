//
//  Passtimes.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation

struct Passtime: Codable {
    var risetime: Int
    var duration: Int
}
struct PasstimesRequest: Codable {
    var altitude: Int
    var datetime: Int
    var latitude: Double
    var longitude: Double
    var passes: Int
}
struct PasstimesResponse: Codable {
    var message: String
    var request: PasstimesRequest
    var response: [Passtime]
}
