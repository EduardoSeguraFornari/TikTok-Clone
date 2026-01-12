//
//  StandardTextFieldModifier.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 12/01/26.
//

import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.primary)
            .padding(.horizontal, 24)
    }
}
