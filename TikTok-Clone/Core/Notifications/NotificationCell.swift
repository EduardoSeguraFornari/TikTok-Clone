//
//  NotificationCell.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color(.systemGray5))

            HStack {
                Text("max.verstapen")
                    .font(.footnote)
                    .fontWeight(.semibold) +

                Text(" liked one of your posts. ")
                    .font(.footnote) +

                Text("3d")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            Spacer()

            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
