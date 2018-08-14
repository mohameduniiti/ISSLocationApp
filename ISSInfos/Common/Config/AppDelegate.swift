//
//  AppDelegate.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Configure the main window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        setNavigation()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func setNavigation() {
        
        let tabController = UITabBarController()
        
        let liveLocation = LiveLocation(nibName: "LiveLocation", bundle: nil)
        let liveLocationItem = UITabBarItem(title: "Live", image: nil, tag: 0)
        liveLocation.tabBarItem = liveLocationItem
        let liveLocationNav = UINavigationController(rootViewController: liveLocation)
        
        let passengersLocation = Passengers(nibName: "Passengers", bundle: nil)
        let passengersLocationItem = UITabBarItem(title: "Passengers", image: nil, tag: 1)
        passengersLocation.tabBarItem = passengersLocationItem
        let passengersLocationNav = UINavigationController(rootViewController: passengersLocation)
        
        let passTimes = PassTimes(nibName: "PassTimes", bundle: nil)
        let passTimesItem = UITabBarItem(title: "PassTimes", image: nil, tag: 2)
        passTimes.tabBarItem = passTimesItem
        let passTimesNav = UINavigationController(rootViewController: passTimes)
        
        let hoveringInfo = HoveringInfo(nibName: "HoveringInfo", bundle: nil)
        let hoveringInfoItem = UITabBarItem(title: "Hovering", image: nil, tag: 3)
        hoveringInfo.tabBarItem = hoveringInfoItem
        let hoveringInfoNav = UINavigationController(rootViewController: hoveringInfo)
        
        tabController.setViewControllers([liveLocationNav, passengersLocationNav, passTimesNav, hoveringInfoNav], animated: true)
        tabController.selectedIndex = 0
        //tabController.tabBar.tintColor = UIColor.black
        
        self.navigationController = UINavigationController(rootViewController: tabController)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.window!.rootViewController = self.navigationController
    }
    
    

}

