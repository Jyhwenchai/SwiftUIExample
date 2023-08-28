//
//  TabBarSheetApp.swift
//  TabBarSheet
//
//  Created by 蔡志文 on 8/28/23.
//

import SwiftUI

@main
struct TabBarSheetApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appdelegate
  let windowSharedModel = WindowSharedModel()
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(windowSharedModel)
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    let config =  UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
    config.delegateClass = SceneDelegate.self
    return config
  }
}

@Observable
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  weak var windowScene: UIWindowScene?
  var tabWindow: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    windowScene = scene as? UIWindowScene
  }

  func addTabBar(_ windowSharedModel: WindowSharedModel) {
    guard let scene = windowScene else {
      return
    }

    let tabBarController = UIHostingController(
      rootView: CustomTabBar()
        .environment(windowSharedModel)
        .frame(maxHeight: .infinity, alignment: .bottom)
    )
    tabBarController.view.backgroundColor = .clear

    let tabWindow = PassThroughWindow(windowScene: scene)
    tabWindow.rootViewController = tabBarController
    tabWindow.isHidden = false

    self.tabWindow = tabWindow
  }
}

class PassThroughWindow: UIWindow {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    guard let view = super.hitTest(point, with: event) else { return nil }
    return rootViewController?.view == view ? nil : view
  }
}
