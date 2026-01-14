//
//  ContentView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel

    private let authService: AuthService
    private let userService: UserServiceProtocol

    init(authService: AuthService, userService: UserServiceProtocol) {
        self.authService = authService
        self.userService = userService
        self._viewModel = StateObject(
            wrappedValue: ContentViewModel(authService: authService, userService: userService)
        )
    }

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                if let user = viewModel.currentUser {
                    MainTabView(authService: authService, user: user)
                }
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService(), userService: UserServiceMock())
}
