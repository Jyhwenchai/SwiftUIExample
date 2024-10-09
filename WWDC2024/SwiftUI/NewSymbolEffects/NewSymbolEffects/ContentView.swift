//
//  ContentView.swift
//  NewSymbolEffects
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI
/**
 - New Symbol Effects
 iOS 18 introduces three new symbol effects.
 1. Wiggle 2. Rotate 3. Breathe.
 */

struct ContentView: View {
  @State private var trigger: Bool = false
    var body: some View {
      Image(systemName: "gearshape")
        .font(.system(size: 100))
        .symbolEffect(.breathe, value: trigger)
        .onTapGesture {
          trigger.toggle()
        }
    }
}

#Preview {
    ContentView()
}
