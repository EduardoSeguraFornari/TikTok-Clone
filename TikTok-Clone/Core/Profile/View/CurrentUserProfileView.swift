//
//  CurrentUserProfileView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 2) {
                    // profile header
                    ProfileHeaderView()

                    // post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
