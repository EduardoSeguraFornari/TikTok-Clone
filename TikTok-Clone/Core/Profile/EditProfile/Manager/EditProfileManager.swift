//
//  EditProfileManager.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import FirebaseAuth
import UIKit

final class EditProfileManager: ObservableObject {
    private let imageUploaderServer: ImageUploaderServer

    init(imageUploaderServer: ImageUploaderServer) {
        self.imageUploaderServer = imageUploaderServer
    }

    func uploadProfileImage(_ uiImage: UIImage) async {
        do {
            let profileImageUrl = try await imageUploaderServer.upload(image: uiImage)
            try await updateUserProfileImageURL(profileImageUrl)
        } catch {
            print("DEBUG: Handle image upload error here...")
        }
    }

    private func updateUserProfileImageURL(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await FirestoreConstants.UsersCollection.document(currentUid).updateData(["profileImageUrl": imageUrl])
    }
}
