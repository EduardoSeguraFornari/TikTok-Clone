//
//  ExploreViewModel.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

import Foundation

@MainActor
final class ExploreViewModel: ObservableObject {
    @Published var users = [User]()

    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol) {
        self.userService = userService
        Task { await fetchUsers() }
    }

    func fetchUsers() async {
        do {
            self.users = try await userService.fetchUsers()
        } catch {
            print("DEBUG: Failed to fetch users with error: \(error.localizedDescription)")
        }
    }
}
