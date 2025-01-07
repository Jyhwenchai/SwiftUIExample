//
//  MultitaskBlurApp.swift
//  MultitaskBlur
//
//  Created by 蔡志文 on 10/30/24.
//

import SwiftUI

@main
struct MySecretsApp: App {
  @Environment(\.scenePhase) private var scenePhase
  @State private var blurRadius: CGFloat = 0

  var body: some Scene {
    WindowGroup {
      ZStack {
        ContentView()
          .blur(radius: blurRadius)

        if blurRadius > 0 {
          Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
        }
      }

      .onChange(of: scenePhase) { _, newValue in
        if newValue == .inactive || newValue == .background {
          withAnimation { blurRadius = 20 }
        } else {
          withAnimation { blurRadius = 0 }
        }
      }
    }
  }
}
