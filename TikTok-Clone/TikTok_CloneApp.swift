//
//  TikTok_CloneApp.swift
//  TikTok-Clone
//
//  Created by Eduardo Segura Fornari on 14/05/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TikTok_CloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let authService = AuthService()

    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService)
        }
    }
}
