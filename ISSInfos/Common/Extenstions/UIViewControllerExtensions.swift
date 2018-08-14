//
//  UIViewControllerExtensions.swift
//  ISSInfos
//
//  Created by Mohamed BOUNAJMA on 8/14/18.
//  Copyright © 2018 Mohamed BOUNAJMA. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

/* This file is for
 adding some functions that we use frequently
 */
extension UIViewController {
    
    // function that shows a two action alers
    func showTwoActionsAlert(title: String? = nil, message: String? = nil, cancelTitle: String, okTitle: String, cancelHandler: ((UIAlertAction) -> Void)? = nil, okHandler: @escaping (UIAlertAction) -> Void, style: UIAlertControllerStyle = .alert, alertCompletion : (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message : message, preferredStyle : style)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okHandler)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: alertCompletion)
        
    }
    
    func goToSettings() {
        
        guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    // reload the data
                })
            } else {
                UIApplication.shared.openURL(settingsUrl)
            }
        }
        
    }
}
