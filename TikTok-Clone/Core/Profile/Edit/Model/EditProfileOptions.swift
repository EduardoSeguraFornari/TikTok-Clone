//
//  EditProfileOptions.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

enum EditProfileOptions: Hashable {
    case name
    case username
    case bio

    var title: String {
        switch self {
        case .name: return "Name"
        case .username: return "Username"
        case .bio: return "Bio"
        }
    }
}
