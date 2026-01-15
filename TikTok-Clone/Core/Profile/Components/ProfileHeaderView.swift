//
//  ProfileHeaderView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    private let user: User

    init(user: User) {
        self.user = user
    }

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                // profile image
                AvatarView(user: user, size: .xLarge)

                // username
                Text("@\(user.username)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }

            // stats view
            HStack(spacing: 16) {
                UserStatView(title: "Following", value: 5)
                UserStatView(title: "Followers", value: 1)
                UserStatView(title: "Likes", value: 7)
            }

            // action button
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}
