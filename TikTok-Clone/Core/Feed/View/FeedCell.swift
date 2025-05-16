//
//  FeedCell.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post

    var body: some View {
        ZStack {
            VideoPlayer(player: AVPlayer(url: post.videoUrl.localUrlWhenInPreviewMode!))
                .containerRelativeFrame([.horizontal, .vertical])

            VStack {
                Spacer()

                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("carlos.saiz")
                            .fontWeight(.semibold)

                        Text("Rocket ship prepare to takeoff!!!")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)

                    Spacer()

                    VStack(spacing: 28) {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)

                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }

                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }

                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundStyle(.white)
                        }

                        Button {
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
    }
}

#Preview {
    FeedCell(
        post: .init(
            id: NSUUID().uuidString,
            videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
        )
    )
}
