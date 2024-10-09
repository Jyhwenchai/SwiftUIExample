//
//  ScrollPhaseChange.swift
//  OnScrollGeometryChnage
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI
/**
  - ScrollPhaseChange

 You can extract some useful scroll information, such scroll status and scroll velocity, with this modifier.
 */

struct ScrollPhaseChange: View {
  var colors: [Color] = [.red, .blue, .green, .yellow, .purple, .cyan, .brown, .black, .indigo]
  @State private var isScrolling: Bool = false
  var body: some View {
    VStack {
      Text(isScrolling ? "Scrolling" : "Idle")
      ScrollView {
        LazyVStack(spacing: 15) {
          ForEach(colors, id: \.self) { color in
            RoundedRectangle(cornerRadius: 20)
              .fill(color.gradient)
              .frame(height: 220)
          }
        }
        .padding(15)
      }
    }
    .onScrollPhaseChange { oldPhase, newPhase in
      isScrolling = newPhase.isScrolling
    }
  }
}

#Preview {
    ScrollPhaseChange()
}
