//
//  AppStructureApp.swift
//  AppStructure
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

@main
struct AppStructureApp: App {
  @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
