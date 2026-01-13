//
//  AuthService.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 13/01/26.
//

import Firebase
import FirebaseAuth

final class AuthService {

    @Published var userSession: FirebaseAuth.User?

    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }

    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email")
    }

    func createUser(
        withEmail email: String, password: String, username: String, fullname: String
    ) async throws {
        print("DEBUG: User info - \(email), \(password), \(username), \(fullname)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: User is created \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to creat user with error \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() {
        
    }
}
