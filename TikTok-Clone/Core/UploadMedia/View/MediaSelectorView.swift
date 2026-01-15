//
//  MediaSelectorView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/01/26.
//

import PhotosUI
import SwiftUI

struct MediaSelectorView: View {
    @State private var showMediaPicker = false
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        NavigationStack {
            VStack {
            
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { showMediaPicker.toggle() }
            .photosPicker(isPresented: $showMediaPicker, selection: $selectedItem, matching: .videos)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Next") {
                        print("DEBUG: Go to upload post...")
                    }
                }
            }
        }
    }
}

#Preview {
    MediaSelectorView()
}
