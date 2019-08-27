//
//  LoginViewController.swift
//  MoneyManagerTest
//
//  Created by Deepak on 8/27/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import GoogleSignIn
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
        GIDSignIn.sharedInstance().signIn()
    }
    @IBAction func onFacebookSignIn(_ sender: UIButton) {
    }
    @IBAction func onSignInButton(_ sender: UIButton) {
    }
}

extension LoginViewController: GIDSignInUIDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        loginVaigator?.navigate(to: .loginCompleted)
    }
}
