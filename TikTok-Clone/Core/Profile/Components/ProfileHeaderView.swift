//
//  ProfileHeaderView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                // profile image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))

                // username
                Text("@lewis.hamilton")
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
    }
}

#Preview {
    ProfileHeaderView()
}
