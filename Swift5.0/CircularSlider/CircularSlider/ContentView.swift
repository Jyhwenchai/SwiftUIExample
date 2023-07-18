//
//  ContentView.swift
//  CircularSlider
//
//  Created by 蔡志文 on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack {
        Home()
          .navigationTitle("Circular Slider")
      }
    }
}

#Preview {
    ContentView()
}
