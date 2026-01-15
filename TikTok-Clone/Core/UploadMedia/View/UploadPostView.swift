//
//  UploadPostView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption: String = ""

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                TextField("Enter your caption", text: $caption, axis: .vertical)
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
            }
            Divider()
            Spacer()
            Button {
                print("DEBUG: Upload post...")
            } label: {
                Text("Post")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(Color(.systemPink))
            }
        }
        .padding()
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        UploadPostView()
    }
}
