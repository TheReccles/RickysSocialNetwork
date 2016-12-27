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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //initialize the listener
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            
            print(snapshot.value)
            
        })

        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    
    

    @IBAction func signOutPressed(_ sender: UIButton) {
        //sign out of keychain and firebase
        let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print("Ricky: ID removed from keychain - \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }

}
