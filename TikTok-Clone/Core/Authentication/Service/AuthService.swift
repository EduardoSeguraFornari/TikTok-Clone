//
//  AuthService.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 13/01/26.
//

import Firebase
import FirebaseAuth

@MainActor
final class AuthService: AuthServiceProtocol {
    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }

    func updateUserSession() {
        Authentication.shared.loggedIn = Auth.auth().currentUser != nil
    }

    func logIn(withEmail email: String, password: String) async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            Authentication.shared.loggedIn = true
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            throw error
        }
    }

    func createUser(
        withEmail email: String, password: String, username: String, fullname: String
    ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            Authentication.shared.loggedIn = true
            try await uploadUserData(withEmail: email, id: result.user.uid, username: username, fullname: fullname)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        Authentication.shared.loggedIn = nil
    }

    func uploadUserData(
        withEmail email: String, id: String, username: String, fullname: String
    ) async throws {
        let user = User(id: id, username: username, email: email, fullName: fullname, bio: nil, profileImageUrl: nil)
        try await userService.uploadUserData(user)
    }
}
