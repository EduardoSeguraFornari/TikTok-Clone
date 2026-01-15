//
//  ContentViewModel.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 13/01/26.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var loggedIn: Bool?
    @Published var currentUser: User?

    private let authService: AuthServiceProtocol
    private let userService: UserServiceProtocol
    private var cancellables: Set<AnyCancellable> = []

    init(authService: AuthServiceProtocol, userService: UserServiceProtocol) {
        self.authService = authService
        self.userService = userService

        setupSubscribers()
        authService.updateUserSession()
    }

    private func setupSubscribers() {
        Authentication.shared.$loggedIn.sink { [weak self] user in
            self?.loggedIn = user
            self?.fetchCurrentUser()
        }.store(in: &cancellables)
    }

    private func fetchCurrentUser() {
        guard loggedIn != nil else { return }
        Task { currentUser = try await userService.fetchCurrentUser() }
    }
}
