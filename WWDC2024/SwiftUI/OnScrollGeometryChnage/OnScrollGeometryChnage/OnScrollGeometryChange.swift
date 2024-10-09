//
//  ContentView.swift
//  OnScrollGeometryChnage
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI
/**
 - onScrollGeometryChange

 We can read scroll offsets, content size, and other scroll parameters directly
 with this modifier, eliminating the need for Preference Keys.
 */

struct OnScrollGeometryChange: View {
  var colors: [Color] = [.red, .blue, .green, .yellow, .purple, .cyan, .brown, .black, .indigo]
  @State private var offset: CGFloat = 0
  var body: some View {
    VStack {
      Text("Scroll Offset Y: \(offset)")
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
    .onScrollGeometryChange(for: CGFloat.self) { proxy in
      return proxy.contentOffset.y
    } action: { oldValue, newValue in
      offset = newValue
    }

  }
}

#Preview {
  OnScrollGeometryChange()
}
