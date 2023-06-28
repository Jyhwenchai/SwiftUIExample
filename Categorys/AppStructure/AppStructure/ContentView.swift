//
//  ContentView.swift
//  AppStructure
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Button("Create a Scene") {
      let userActivity = NSUserActivity(
        activityType: "me.michaelfcollins3.MultipleSceneApp.SceneTwo"
      )
      userActivity.targetContentIdentifier =
      "me.michaelfcollins3.MultipleSceneApp.SceneTwo"

      UIApplication.shared.requestSceneSessionActivation(
        nil,
        userActivity: userActivity,
        options: nil,
        errorHandler: nil
      )
    }
  }
}

#Preview {
  ContentView()
}
