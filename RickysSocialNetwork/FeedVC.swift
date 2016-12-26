//
//  FeedVC.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/26/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func signOutPressed(_ sender: UIButton) {
        //sign out of keychain and firebase
        let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print("Ricky: ID removed from keychain - \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }

}
