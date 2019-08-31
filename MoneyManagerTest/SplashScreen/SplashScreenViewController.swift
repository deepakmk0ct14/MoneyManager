//
//  SplashScreenViewController.swift
//  MoneyManagerTest
//
//  Created by Deepak on 8/29/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class SplashScreenViewController: UIViewController {
    var initialNavigator: InitialRouter?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialNavigator = InitialRouter(currentViewController: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if GIDSignIn.sharedInstance().hasAuthInKeychain() || (AccessToken.current != nil)  {
               self.initialNavigator?.navigate(to: .loggedIn)
            } else {
                 self.initialNavigator?.navigate(to: .notLoggedIn)
            }
        }
    }
}
