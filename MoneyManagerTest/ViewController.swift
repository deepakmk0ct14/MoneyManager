//
//  ViewController.swift
//  MoneyManagerTest
//
//  Created by Deepak on 8/25/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import UIKit
import GoogleSignIn
class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }

    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
        guard error == nil else {
            
            print("Error while trying to redirect : \(error)")
            return
        }
        
        print("Successful Redirection")
    }
    
    
    //MARK: GIDSignIn Delegate
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
    {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            print("User id is \(String(describing: userId))")
            
            let idToken = user.authentication.idToken // Safe to send to the server
            print("Authentication idToken is \(idToken)")
            let fullName = user.profile.name
            print("User full name is \(fullName)")
            let givenName = user.profile.givenName
            print("User given profile name is \(givenName)")
            let familyName = user.profile.familyName
            print("User family name is \(familyName)")
            let email = user.profile.email
            print("User email address is \(email)")
            // ...
        } else {
            print("ERROR ::\(error.localizedDescription)")
        }
    }
    
    // Finished disconnecting |user| from the app successfully if |error| is |nil|.
    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!)
    {
        
    }


}

