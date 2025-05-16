//
//  String+Extensions.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/05/25.
//

import Foundation

extension Post {
    static var localVideoUrls: [String] = ["ForBiggerBlazes", "ForBiggerEscapes", "ForBiggerJoyrides", "WhatCarCanYouGetForAGrand"]
    static var localVideoUrlForPostId: [String : String] = [:]

    var getLocalVideoUrl: String {
        let first = Post.localVideoUrls.removeFirst()
        Post.localVideoUrls.append(first)
        return first
    }

    var localUrlWhenInPreviewMode: URL? {
        var videoUrlString = Post.localVideoUrlForPostId[self.id]
        if videoUrlString == nil {
            videoUrlString = getLocalVideoUrl
            Post.localVideoUrlForPostId[self.id] = videoUrlString
        }
        return Bundle.main.url(forResource: videoUrlString, withExtension: "mp4")
    }
}
