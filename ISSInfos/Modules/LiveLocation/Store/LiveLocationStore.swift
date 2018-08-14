//
//  LiveLocationStore.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation

class LiveLocationStore {
    
    static func getISSLiveLocation (completion: @escaping (ISSLocationInfo?) -> Void) {
        
        guard let liveURL = URL(string: URLs.ISSLocationURL) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: liveURL) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                let liveData = try decoder.decode(ISSLocationInfo.self, from: data)
                completion(liveData)
            } catch let err {
                print("Error", err)
            }
        }.resume()
        
    }
    
}
