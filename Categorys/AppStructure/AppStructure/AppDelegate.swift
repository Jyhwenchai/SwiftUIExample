//
//  AppDelegate.swift
//  AppStructure
//
//  Created by 蔡志文 on 6/28/23.
//

import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    if let userActivity = options.userActivities.first {
      switch userActivity.activityType {
      case "me.michaelfcollins3.MultipleSceneApp.SceneTwo":
        let sceneTwoConfiguration = UISceneConfiguration(
          name: "SceneTwo",
          sessionRole: connectingSceneSession.role
        )
        sceneTwoConfiguration.delegateClass = SceneTwoDelegate.self
        return sceneTwoConfiguration

      default:
        break
      }
    }

    return UISceneConfiguration(
      name: "MainScene",
      sessionRole: connectingSceneSession.role
    )
  }
}
