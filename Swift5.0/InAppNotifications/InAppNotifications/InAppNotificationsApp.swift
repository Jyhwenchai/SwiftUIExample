//
//  InAppNotificationsApp.swift
//  InAppNotifications
//
//  Created by 蔡志文 on 11/29/23.
//

import SwiftUI

@main
struct InAppNotificationsApp: App {
  @State private var overlayWindow: PassThroughWindow?
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onAppear(perform: {
          if overlayWindow == nil {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
              let overlayWindow = PassThroughWindow(windowScene: windowScene)
              overlayWindow.backgroundColor = .clear
              let controller = StatusBarBasedController()
              controller.view.backgroundColor = .clear
              overlayWindow.rootViewController = controller
              overlayWindow.tag = 0320
              overlayWindow.isHidden = false
              overlayWindow.isUserInteractionEnabled = true
              self.overlayWindow = overlayWindow
              print("Overlay Window Created")
            }
          }
        })
    }
  }
}

class StatusBarBasedController: UIViewController {
  var statusBarStyle: UIStatusBarStyle = .default
  override var preferredStatusBarStyle: UIStatusBarStyle { statusBarStyle }
}

fileprivate class PassThroughWindow: UIWindow {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    guard let view = super.hitTest(point, with: event) else { return nil }
    return rootViewController?.view == view ? nil : view
  }
}
