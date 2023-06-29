//
//  AppStructureApp.swift
//  AppStructure
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI
/// 一个 `App` 可以包含有多个 `Scene`，这依赖于对应的平台
/// 使用 `scenePhase` 环境变量可以监听 `Scene` 的生命周期状态
/// 使用 `openWindow` 环境变量可以打开一个新 `Scene`，如果该 `Scene` 已经存在，那么该 `Scene` 会显示在最前面
/// 使用 `dimiss` 或 `dismissWindow` 环境变量可以关闭一个 `Scene`
@main
struct AppStructureApp: App {
  @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
  @Environment(\.scenePhase) private var scenePhase

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .onChange(of: scenePhase) { oldValue, newValue in
      // scene life cycle state
      print(oldValue, newValue)
    }

  #if os(macOS)
    Window("Third Window", id: "scene-three") {
      ThirdSceneView()
    }
    #endif
  }
}
