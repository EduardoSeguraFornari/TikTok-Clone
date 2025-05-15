//
//  UserStatView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/05/25.
//

import SwiftUI

struct UserStatView: View {
    let title: String
    let value: Int

    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStatView(title: "Followers", value: 5)
}
