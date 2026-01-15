//
//  RegistrationView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 12/01/26.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RegistrationViewModel

    init(authService: AuthServiceProtocol) {
        self._viewModel = StateObject(wrappedValue: RegistrationViewModel(service: authService))
    }

    var body: some View {
        VStack {
            Spacer()

            Image("tiktok-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()

            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())

                SecureField("Enter your password", text: $password)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())

                TextField("Enter your full name", text: $fullname)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())

                TextField("Enter your username", text: $username)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
            }

            Button {
                Task {
                    await viewModel.crateUser(
                        withEmail: email, password: password, username: username, fullname: fullname
                    )
                }
            } label: {
                Text("Sing Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.7)

            Spacer()

            Divider()

            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return email.isValidEmail &&
        password.isValidPassword &&
        fullname.isValidFullName &&
        username.isValidUsername
    }
}

#Preview {
    RegistrationView(authService: AuthServiceMock())
}
