//
//  String+Extensions.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 15/05/25.
//

import Foundation

extension String {
    static var localVideoUrls: [String] = ["ForBiggerBlazes", "ForBiggerEscapes", "ForBiggerJoyrides", "WhatCarCanYouGetForAGrand"]

    func rotateLocalVideoUrls() {
        let first = String.localVideoUrls.removeFirst()
        String.localVideoUrls.append(first)
    }

    var localUrlWhenInPreviewMode: URL? {
        let videoUrlString = String.localVideoUrls.first ?? ""
        rotateLocalVideoUrls()
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return Bundle.main.url(forResource: videoUrlString, withExtension: "mp4")
        } else {
            return URL(string: self)
        }
    }
}
