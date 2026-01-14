//
//  Firestore+Constants.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

import FirebaseFirestore

struct FirestoreConstants {
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
}
