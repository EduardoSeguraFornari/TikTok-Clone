//
//  ExploreView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel(userService: UserService())

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExploreView()
}
