//
//  SceneTwoDelegate.swift
//  AppStructure
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI
import UIKit

final class SceneTwoDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else {
      fatalError("Expected a UIWindowScene")
    }

    let predicate = NSPredicate(
      format: "self == %@",
      "me.michaelfcollins3.MultipleSceneApp.SceneTwo"
    )

    scene.activationConditions.canActivateForTargetContentIdentifierPredicate = predicate
    scene.activationConditions.prefersToActivateForTargetContentIdentifierPredicate = predicate

    let contentView = SecondSceneView()
      .environment(\.sceneSession, session)
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = UIHostingController(rootView: contentView)
    window.makeKeyAndVisible()
    self.window = window
  }
}
