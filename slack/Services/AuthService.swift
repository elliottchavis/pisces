//
//  AuthService.swift
//  slack
//
//  Created by elliott chavis on 4/25/22.
//

import Foundation
import FirebaseFirestore
import Firebase

struct RegistrationCredentials {
    let email: String
    let password: String
    let username: String
}

class AuthService {
    
    static let instance = AuthService()
    
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
                Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        } set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        } set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        } set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }

    
    func createUser(credentials: RegistrationCredentials, completion: ((Error?) -> Void)?) {
       
                Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                    if let error = error {
                        completion!(error)
                        return
                    }
                    
                    guard let uid = result?.user.uid else { return }
                    
                    let data = ["email": credentials.email,
                                "uid": uid,
                                "username": credentials.username]
                    
                    Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                }
    }
    
}
