//
//  Authentication.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import Foundation

@MainActor
final class Authentication {
    static let shared = Authentication()
    @Published var loggedIn: Bool?

    private init() { }
}
