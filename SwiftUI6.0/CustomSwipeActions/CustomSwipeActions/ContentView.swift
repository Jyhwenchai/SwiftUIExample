//
//  ContentView.swift
//  CustomSwipeActions
//
//  Created by 蔡志文 on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack {
        Home()
          .navigationTitle("Messages")
      }
    }
}

#Preview {
    ContentView()
}
