//
//  ComplexAuthProfileManager.swift
//  Test_Alemeno
//
//  Created by Shivam Chawla on 09/10/23.
//

import Foundation

class ComplexAuthProfileManager {
    var userId: String
    var username: String
    var isLoggedIn: Bool = false

    init(userId: String, username: String) {
        self.userId = userId
        self.username = username
    }

    func loginWithUsername(username: String, password: String) -> Bool {
        // Simulate login logic here
        if username == self.username && password == "password123" {
            isLoggedIn = true
            return true
        }
        return false
    }

    func logout() {
        isLoggedIn = false
    }

    func registerWithUsername(username: String, password: String) -> Bool {
        // Simulate registration logic here
        self.username = username
        return true
    }

    func updateProfileInformation(newUsername: String) {
        self.username = newUsername
    }
}
