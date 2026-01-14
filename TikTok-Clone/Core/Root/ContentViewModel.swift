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
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    private let authService: AuthService
    private let userService: UserServiceProtocol
    private var cancellables: Set<AnyCancellable> = []

    init(authService: AuthService, userService: UserServiceProtocol) {
        self.authService = authService
        self.userService = userService

        setupSubscribers()
        authService.updateUserSession()
    }

    private func setupSubscribers() {
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user
            self?.fetchCurrentUser()
        }.store(in: &cancellables)
    }

    private func fetchCurrentUser() {
        guard userSession != nil else { return }
        Task { currentUser = try await userService.fetchCurrentUser() }
    }
}
