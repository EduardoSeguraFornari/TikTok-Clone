//
//  LoginView.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 12/01/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel

    private let authService: AuthServiceProtocol
    @State private var email = ""
    @State private var password = ""

    init(authService: AuthServiceProtocol) {
        self.authService = authService
        self._viewModel = StateObject(wrappedValue: LoginViewModel(service: authService))
    }
    var body: some View {
        NavigationStack {
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
                }

                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Button {
                    Task { await viewModel.login(withEmail: email, password: password) }
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
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.7)

                Spacer()

                Divider()

                NavigationLink {
                    RegistrationView(authService: authService)
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

// MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return email.isValidEmail && password.isValidPassword
    }
}

#Preview {
    LoginView(authService: AuthServiceMock())
}
