//
//  SceneSessionKey.swift
//  AppStructure
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI
import UIKit

struct SceneSessionKey: EnvironmentKey {
  static var defaultValue: UISceneSession?
}

extension EnvironmentValues {
  var sceneSession: UISceneSession? {
    get {
      return self[SceneSessionKey.self]
    }
    set {
      self[SceneSessionKey.self] = newValue
    }
  }
}
