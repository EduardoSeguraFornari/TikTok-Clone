//
//  EditProfileView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/01/26.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss

    @State private var selectedPickerItem: PhotosPickerItem?
    @StateObject private var manager = EditProfileManager(imageUploaderServer: ImageUploaderServer())
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?
    private let user: User

    init(user: User) {
        self.user = user
    }

    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: avatarSize.dimention, height: avatarSize.dimention)
                                .clipShape(Circle())
                        } else {
                            AvatarView(user: user, size: avatarSize)
                        }
                        Text("Change photo")
                    }
                }
                .buttonStyle(.plain)
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    EditProfileOptionRowView(option: .name, value: user.fullName)
                    EditProfileOptionRowView(option: .username, value: user.username)
                    EditProfileOptionRowView(option: .bio, value: user.bio ?? "Add a bio")
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .task(id: selectedPickerItem) {
                await loadImage(fromItem: selectedPickerItem)
            }
            .navigationDestination(for: EditProfileOptions.self) { option in
                EditProfileDetailView(option: option, user: user)
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                    .foregroundStyle(.black)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        onDoneTapped()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

private extension EditProfileView {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }

    func onDoneTapped() {
        Task {
            guard let uiImage else { return }
            await manager .uploadProfileImage(uiImage)
            dismiss()
        }
    }

    var avatarSize: AvatarSize { .large }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}
