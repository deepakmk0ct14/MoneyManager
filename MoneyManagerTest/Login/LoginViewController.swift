//
//  LoginViewController.swift
//  MoneyManagerTest
//
//  Created by Deepak on 8/27/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
class LoginViewController: UIViewController {

    @IBOutlet weak var mEmailTextField: UITextField!
    @IBOutlet weak var mPasswordTextField: UITextField!
    var loginVaigator: LoginNavigator?
    override func viewDidLoad() {
        super.viewDidLoad()
        loginVaigator = LoginNavigator(currentViewController: self)
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func onGoogleSignIn(_ sender: UIButton) {
        if !GIDSignIn.sharedInstance().hasAuthInKeychain() {
            GIDSignIn.sharedInstance().signIn()
        }else {
            loginVaigator?.navigate(to: .loginCompleted)
        }
    }
    @IBAction func onFacebookSignIn(_ sender: UIButton) {
        let loginManager = LoginManager()
        
        loginManager.logIn(permissions: [ "publicProfile","privateProfile" ], from: self) { (loginResult, error) in
            print("User cancelled login.", loginResult)
        }
    }
    @IBAction func onSignInButton(_ sender: UIButton) {
        
    }
}

extension LoginViewController: GIDSignInUIDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if user != nil {
            loginVaigator?.navigate(to: .loginCompleted)
        }
    }
}
