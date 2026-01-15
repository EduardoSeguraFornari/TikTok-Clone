//
//  LoginViewModel.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 13/01/26.
//

import Foundation

final class LoginViewModel: ObservableObject {
    private let service: AuthServiceProtocol

    init(service: AuthServiceProtocol) {
        self.service = service
    }

    func login(withEmail email: String, password: String) async {
        do {
            try await service.logIn(withEmail: email, password: password)
        } catch {
            print("DEBUG: Did fail to log in with error \(error)")
        }
    }
}
