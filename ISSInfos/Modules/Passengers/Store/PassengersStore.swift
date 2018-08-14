//
//  PassengersStore.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation

class PassengersStore {
    
    static func getISSPassengers(completion: @escaping (ISSPassengers?) -> Void) {
        
        guard let passengersURL = URL(string: URLs.ISSPassengers) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: passengersURL) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                let passengersData = try decoder.decode(ISSPassengers.self, from: data)
                print("passengers \(passengersData.message) count \(passengersData.people.count)")
                completion(passengersData)
            } catch let err {
                print("Error", err)
            }
            }.resume()
        
    }
    
}
