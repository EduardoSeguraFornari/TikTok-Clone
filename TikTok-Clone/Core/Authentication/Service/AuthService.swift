//
//  AuthService.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 13/01/26.
//

import Foundation
import Firebase

final class AuthService {
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email")
    }

    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullname: String) async throws {
        print("DEBUG: User info - \(email), \(password), \(username), \(fullname)")
    }

    func signOut() {
        
    }
}
