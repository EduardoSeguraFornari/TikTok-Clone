//
//  UserServiceProtocol.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

protocol UserServiceProtocol {
    func uploadUserData(_ user: User) async throws
    func fetchCurrentUser() async throws -> User?
    func fetchUsers() async throws -> [User]
}
