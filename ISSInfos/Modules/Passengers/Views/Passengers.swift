//
//  Passengers.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import UIKit

class Passengers: UIViewController {
    //MARK: outlets
    @IBOutlet weak var passengersTableView: UITableView!
    
    //MARK: vars
    var passengers: ISSPassengers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        passengersTableView.delegate = self
        passengersTableView.dataSource = self
        getISSPassengers()
    }
    
    // retrieving passengers info from API
    func getISSPassengers() {
        PassengersStore.getISSPassengers { [unowned self] passengers in
            self.passengers = passengers
            DispatchQueue.main.async {
                self.passengersTableView.reloadData()
            }
        }
    }
}
