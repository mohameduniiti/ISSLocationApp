//
//  PasstimesStore.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation

class PasstimesStore {
    
    static func getPasstimes(userLat: Double, userLng: Double, completion: @escaping (PasstimesResponse?) -> Void) {
        
        guard let passTimesURL = URL(string: "\(URLs.ISSPassTimes)?lat=\(userLat)&lon=\(userLng)") else {
            completion(nil)
            return
        }
        print("url \(passTimesURL)")
        URLSession.shared.dataTask(with: passTimesURL) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                let passTimesData = try decoder.decode(PasstimesResponse.self, from: data)
                print("passTimes \(passTimesData.message) count \(passTimesData.response.count)")
                completion(passTimesData)
            } catch let err {
                print("Error", err)
            }
            }.resume()
        
    }
    
}
