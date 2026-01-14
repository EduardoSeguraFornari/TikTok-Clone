//
//  AuthService.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 13/01/26.
//

import Firebase
import FirebaseAuth

@MainActor
final class AuthService {
    @Published var userSession: FirebaseAuth.User?

    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }

    func logIn(withEmail email: String, password: String) async throws {
        print("DEBUG: User info - \(email), \(password)")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User \(email) did log in")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            throw error
        }
    }

    func createUser(
        withEmail email: String, password: String, username: String, fullname: String
    ) async throws {
        print("DEBUG: User info - \(email), \(password), \(username), \(fullname)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User is created \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
