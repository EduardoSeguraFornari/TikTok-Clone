//
//  User.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

struct User: Identifiable, Hashable {
    let id: String
    let username: String
    let email: String
    let fullName: String
    var bio: String?
    var profileImage: String?
}

extension User: Codable { }
