//
//  UserServiceMock.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

struct UserServiceMock: UserServiceProtocol {
    func uploadUserData(_ user: User) async throws { }

    func fetchCurrentUser() async throws -> User? {
        DeveloperPreview.user
    }

    func fetchUsers() async throws -> [User] {
        DeveloperPreview.users
    }
}
