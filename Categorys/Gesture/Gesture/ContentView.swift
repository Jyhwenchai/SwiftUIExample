//
//  ContentView.swift
//  Gesture
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(data, id: \.0) { section in
          Section(section.0) {
            ForEach(section.1) { item in
              NavigationLink(destination: item.view) {
                Text(item.title)
              }
            }
          }
        }
      }
      .navigationTitle("Gesture")
    }
  }
}

#Preview {
  ContentView()
}
