//
//  CurrentUserProfileView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    private let authService: AuthService
    private let user: User

    init(authService: AuthService, user: User) {
        self.authService = authService
        self.user = user
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 2) {
                    // profile header
                    ProfileHeaderView(user: user)

                    // post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Sign Out") {
                        authService.signOut()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService(), user: DeveloperPreview.user)
}
