//
//  AuthServiceMock.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import Foundation

@MainActor
final class AuthServiceMock: AuthServiceProtocol {
    init() { }

    func updateUserSession() {
        Authentication.shared.loggedIn = nil
    }

    func logIn(withEmail email: String, password: String) async throws {
        Authentication.shared.loggedIn = true
    }

    func createUser(
        withEmail email: String, password: String, username: String, fullname: String
    ) async throws {
        Authentication.shared.loggedIn = true
    }

    func signOut() {
        Authentication.shared.loggedIn = nil
    }

    func uploadUserData(
        withEmail email: String, id: String, username: String, fullname: String
    ) async throws {
        
    }
}
