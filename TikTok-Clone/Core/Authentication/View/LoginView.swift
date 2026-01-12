//
//  LoginView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 12/01/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // login image
                Image("tiktok-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()

                // text fields
                VStack {
                    TextField("Enter your enail", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())

                    SecureField("Enter your password", text: $password)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                }

                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 20)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                // login button

                Button {
                    print("aqui")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)

                Spacer()

                // go to sign up
                Divider()

                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
