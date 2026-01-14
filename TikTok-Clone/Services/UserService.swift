//
//  UserService.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

import FirebaseAuth
import FirebaseFirestore

protocol UserServiceProtocol {
    func uploadUserData(_ user: User) async throws
    func fetchUsers() async throws -> [User]
}

struct UserService: UserServiceProtocol {
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            print("DEBUG: Failed to update user data with error \(error.localizedDescription)")
            throw error
        }
    }

    func fetchUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}

struct UserServiceMock: UserServiceProtocol {
    func uploadUserData(_ user: User) async throws { }

    func fetchUsers() async throws -> [User] {
        DeveloperPreview.users
    }
}
