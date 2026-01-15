//
//  AuthServiceProtocol.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import Foundation

@MainActor
protocol AuthServiceProtocol {
    func updateUserSession()

    func logIn(withEmail email: String, password: String) async throws

    func createUser(
        withEmail email: String, password: String, username: String, fullname: String
    ) async throws

    func signOut()

    func uploadUserData(
        withEmail email: String, id: String, username: String, fullname: String
    ) async throws
}
