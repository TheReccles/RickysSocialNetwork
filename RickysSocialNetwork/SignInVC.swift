//
//  SignInVC.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/24/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var pwdField: FancyField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ViewDidLoad cannot perform segues
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("Ricky: ID found in keychain")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }
    
    @IBAction func facebookBtnPressed(_ sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        //requesting permissions from email address, authentication with facebook
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Ricky: Unable to authenticate with Facebook - \(error)")
            }
            else if result?.isCancelled == true {
                print("Ricky: User cancelled Facebook authentication")
            }
            else {
                print("Ricky: Successfully authenticated with Facebook")
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)            }
            
        }
        
    }
    
    //authenticating with firebase
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Ricky: Unable to authenticate with Firebase - \(error)")
            }
            else {
                print("Ricky: Successfully authenticated with Friebase")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
                
            }
        })
    }

    @IBAction func signInPressed(_ sender: UIButton) {
        
        if let email = emailField.text, let pwd = pwdField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Ricky: Email user authenticated with Firebase")
                    if let user = user {
                        self.completeSignIn(id: (user.uid))
                    }
                }
                else {
                    //user doesnt exist so try to create
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Ricky: Unable to authenticate with Firebase using email")
                        }
                        else {
                            print("Ricky: Successfully authenticated with Firebase")
                            if let user = user {
                                self.completeSignIn(id: (user.uid))
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Ricky: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

