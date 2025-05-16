//
//  FeedViewModel.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/05/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()

    private let videoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
    ]

    init() {
        fetchPosts()
    }

    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[0]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[1]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[2]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[3])
        ]
    }
}
