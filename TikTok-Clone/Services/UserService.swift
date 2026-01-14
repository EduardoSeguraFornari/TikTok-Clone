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
    func fetchCurrentUser() async throws -> User?
    func fetchUsers() async throws -> [User]
}

struct UserService: UserServiceProtocol {
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await FirestoreConstants.UsersCollection.document(user.id).setData(userData)
        } catch {
            print("DEBUG: Failed to update user data with error \(error.localizedDescription)")
            throw error
        }
    }

    func fetchCurrentUser() async throws -> User? {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return nil }
        return try await FirestoreConstants.UsersCollection.document(currentUserId).getDocument(as: User.self)
    }

    func fetchUsers() async throws -> [User] {
        let snapshot = try await FirestoreConstants.UsersCollection.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}

struct UserServiceMock: UserServiceProtocol {
    func uploadUserData(_ user: User) async throws { }

    func fetchCurrentUser() async throws -> User? {
        DeveloperPreview.user
    }

    func fetchUsers() async throws -> [User] {
        DeveloperPreview.users
    }
}
