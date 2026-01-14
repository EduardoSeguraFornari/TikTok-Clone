//
//  FeedView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI
import AVKit

@MainActor
struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear { playInicialVideoIfNecessary() }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear { player.play() }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
    }

    func playInicialVideoIfNecessary() {
        guard scrollPosition == nil, let firstPost = viewModel.posts.first else { return }
        let item = AVPlayerItem(url: firstPost.localUrlWhenInPreviewMode!)
        player.replaceCurrentItem(with: item)
    }

    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        let item = AVPlayerItem(url: currentPost.localUrlWhenInPreviewMode!)
        player.replaceCurrentItem(with: item)
        player.play()
    }
}

#Preview {
    FeedView()
}
