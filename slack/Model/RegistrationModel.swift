//
//  RegistrationModel.swift
//  slack
//
//  Created by elliott chavis on 5/1/22.
//

import UIKit

struct RegistrationModel {
    var email: String?
    var password: String?
    var username: String?
    
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
            && username?.isEmpty == false
            && password!.count > 7

    }
}
