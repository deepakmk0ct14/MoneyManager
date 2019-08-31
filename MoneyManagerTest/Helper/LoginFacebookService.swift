//
//  LoginFacebookService.swift
//  MoneyManagerTest
//
//  Created by Deepak on 8/29/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class LoginFacebookService: NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Initialize sign-in
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
               return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ApplicationDelegate.shared.application(app, open: url, options: options)
    }
}
