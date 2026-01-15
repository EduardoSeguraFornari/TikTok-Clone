//
//  EditProfileDetailView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss

    @State private var value = ""
    private let option: EditProfileOptions
    private let user: User

    init(option: EditProfileOptions, user: User) {
        self.option = option
        self.user = user
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add your bio", text: $value)

                Spacer()

                if !value.isEmpty {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
            }

            Divider()

            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear { onViewAppear() }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    dismiss()
                }
                .fontWeight(.semibold)
            }
            
        }
    }
}

private extension EditProfileDetailView {
    var subtitle: String {
        switch option {
        case .bio:
            "Tell us a little bit about yourself"
        case .name:
            "Your full name can only be changed once every 7 days"
        case .username:
            "Usernames can contain only letters, number, underscores, and periods."
        }
    }

    func onViewAppear() {
        switch option {
        case .bio:
            value = user.bio ?? ""
        case .name:
            value = user.fullName
        case .username:
            value = user.username
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileDetailView(option: .username, user: DeveloperPreview.user)
    }
}
