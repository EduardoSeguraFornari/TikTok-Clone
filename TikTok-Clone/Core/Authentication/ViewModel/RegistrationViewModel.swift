//
//  RegistrationViewModel.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 13/01/26.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    private let service: AuthService

    init(service: AuthService) {
        self.service = service
    }

    func crateUser(withEmail email: String, password: String, username: String, fullname: String) async {
        do {
            try await service.createUser(withEmail: email, password: password, username: username, fullname: fullname)
        } catch {
            print("DEBUG: Did fail to create user with error \(error)")
        }
    }
}
