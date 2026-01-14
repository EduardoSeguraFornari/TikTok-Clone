//
//  UserService.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

import FirebaseAuth
import FirebaseFirestore

struct UserService {
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            print("DEBUG: Failed to update user data with error \(error.localizedDescription)")
            throw error
        }
    }
}
