//
//  File.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class Networking {
    
    func createUser(email: String, passWord: String) {
        Auth.auth().createUser(withEmail: email, password: passWord) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
        }
    }
}
