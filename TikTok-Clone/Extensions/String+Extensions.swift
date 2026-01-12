//
//  String+Extensions.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 12/01/26.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regexString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regexString)
            .evaluate(with: self)
    }

    var isValidFullName: Bool {
        // This regex allows Unicode letters (\p{L}), spaces, hyphens, and apostrophes.
        // It ensures the name is not empty and doesn't start or end with a space/hyphen/apostrophe.
        let regexString = #"^(?=\p{L})[\p{L}\s'-]+(?<=\p{L})$"#
        return NSPredicate(format: "SELF MATCHES %@", regexString)
            .evaluate(with: self)
    }

    var isValidPassword: Bool {
        let regexString = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()\\-_=+{}|?>.<,:;~`]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", regexString)
            .evaluate(with: self)
    }

    var isValidUsername: Bool {
        let regexString = #"^[a-zA-Z0-9_]{3,16}$"#
        return NSPredicate(format: "SELF MATCHES %@", regexString)
            .evaluate(with: self)
    }
}
