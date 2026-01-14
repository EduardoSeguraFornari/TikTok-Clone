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

    init(authService: AuthService) {
        self.authService = authService
        self._viewModel = StateObject(wrappedValue: ContentViewModel(authService: authService))
    }

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView(authService: authService)
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService())
}
