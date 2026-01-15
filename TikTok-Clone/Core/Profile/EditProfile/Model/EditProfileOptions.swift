//
//  EditProfileOptions.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

enum EditProfileOptions: Hashable {
    case bio
    case name
    case username

    var title: String {
        switch self {
        case .bio: return "Bio"
        case .name: return "Name"
        case .username: return "Username"
        }
    }
}
