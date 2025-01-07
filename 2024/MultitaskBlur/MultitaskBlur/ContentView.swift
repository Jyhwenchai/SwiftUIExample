//
//  ContentView.swift
//  MultitaskBlur
//
//  Created by 蔡志文 on 10/30/24.
//

import SwiftUI

struct ContentView: View {
  // Monitoring the value of the scenePhase from the app environment
  @Environment(\.scenePhase) private var scenePhase
  // Value of the radius of the blur effect
  @State private var blurRadius: CGFloat = 0

  var body: some View {
    NavigationStack {
      List(SecretsStore.secrets, id: \.self) { secret in
        Text(.init(secret))
          .listRowSeparator(.hidden)
          .fontDesign(.monospaced)
      }
      .listStyle(.inset)
      .navigationTitle("My Secrets")
      
      // The blur modifier
      .blur(radius: blurRadius)
    }
    // Changes the blurRadius value when the scene phase changes
    .onChange(of: scenePhase) { _, newPhase in
      if newPhase == .inactive || newPhase == .background {
        withAnimation { blurRadius = 20 }
      } else {
        withAnimation { blurRadius = 0 }
      }
    }
  }
}

#Preview {
  ContentView()
}
