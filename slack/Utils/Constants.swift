//
//  Constants.swift
//  slack
//
//  Created by elliott chavis on 4/25/22.
//

import Foundation
import FirebaseFirestore

typealias CompletionHandler = (_ Success: Bool) -> ()

//MARK: - User Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
let COLLECTION_USERS = Firestore.firestore().collection("users")


