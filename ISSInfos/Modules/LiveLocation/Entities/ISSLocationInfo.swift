//
//  ISSLocationInfo.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation
struct ISSLocation: Codable {
    var latitude : String
    var longitude: String
}

struct ISSLocationInfo: Codable {
    var timestamp: Int = 0
    var message: String = ""
    var location: ISSLocation?
    private enum CodingKeys: String, CodingKey {
        case timestamp
        case message
        case location = "iss_position"
    }
}
