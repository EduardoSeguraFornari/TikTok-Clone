//
//  EditProfileOptionRowView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String

    var body: some View {
        NavigationLink(value: option) {
            Text(option.title)
            Spacer()
            Text(value)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    EditProfileOptionRowView(option: .username, value: "lewis_hamilton")
}
