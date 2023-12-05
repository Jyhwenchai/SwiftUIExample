//
//  ContentView.swift
//  FullScreenPop
//
//  Created by 蔡志文 on 12/5/23.
//

import SwiftUI

struct ContentView: View {
  @State private var isEnabled = false
  var body: some View {
    FullSwipeNavigationStack {
      List {
        Section("Sample Header") {
          NavigationLink("Full Swipe View") {
            List {
              Toggle("Enable Full Swipe Pop", isOn: $isEnabled)
                .enableFullSwipePop(isEnabled)
            }
            .navigationTitle("Full Swipe View")
            .onDisappear {
              isEnabled = false
            }
          }

          NavigationLink("Leading Swipe View") {
            Text("")
              .navigationTitle("Leading Swipe View")
          }
        }
      }
      .navigationTitle("Full Swipe Pop")
    }
  }
}

#Preview {
  ContentView()
}
