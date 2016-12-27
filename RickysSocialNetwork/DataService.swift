//
//  DataService.swift
//  RickysSocialNetwork
//
//  Created by Richard Eccles on 12/27/16.
//  Copyright © 2016 Richard Eccles. All rights reserved.
//

import Foundation
import Firebase

//get database URL from GoogleService.plist
let DB_BASE = FIRDatabase.database().reference()

class DataService {
    
    //Singleton - instance of a class that is globally accessible
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    //this is so no one else can access the private variables
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    //create A Firebase User's information
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    
    
    
    
}
