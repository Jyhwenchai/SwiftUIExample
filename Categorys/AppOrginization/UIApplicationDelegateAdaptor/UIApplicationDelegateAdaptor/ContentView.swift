//
//  ContentView.swift
//  UIApplicationDelegateAdaptor
//
//  Created by 蔡志文 on 10/18/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var appDelegate: MyAppDelegate
  @EnvironmentObject private var sceneDelegate: MySceneDelegate
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("app delegate:  \(appDelegate.date.formatted(date: .omitted, time: .standard))")
      Text("scene delegate:  \(sceneDelegate.date.formatted(date: .omitted, time: .standard))")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
