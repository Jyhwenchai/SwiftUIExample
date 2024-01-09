//
//  UIApplicationDelegateAdaptorApp.swift
//  UIApplicationDelegateAdaptor
//
//  Created by 蔡志文 on 10/18/23.
//

import SwiftUI

@main
struct UIApplicationDelegateAdaptorApp: App {
  @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}


class MyAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
  @Published var date: Date = .now
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print(#function)
    Timer.publish(every: 1, on: .main, in: .default)
      .autoconnect()
      .assign(to: &$date)
    return true
  }
}


class MySceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
  @Published var date: Date = .now
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    print(#function)
    Timer.publish(every: 1, on: .main, in: .default)
      .autoconnect()
      .assign(to: &$date)
  }

  func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
    print(#function)
    completionHandler(true)
  }
}

extension MyAppDelegate {
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    print(#function)
    let configuration = UISceneConfiguration(
      name: nil,
      sessionRole: connectingSceneSession.role)
    if connectingSceneSession.role == .windowApplication {
      configuration.delegateClass = MySceneDelegate.self
    }
    return configuration
  }
}
