//
//  OnScrollVisibilityChange.swift
//  OnScrollGeometryChnage
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI

/**
 - OnScrollVisibilityChange

 This modifier notifies us when the view is in the viewable area or has moved off the screen. It will be especially useful in scenarios where short-form videos are played using vertical page view, allowing the videos to be halted when the view is not in the viewable region.
 */

struct OnScrollVisibilityChange: View {
  var colors: [Color] = [.red, .blue, .green, .yellow, .purple, .cyan, .brown, .black, .indigo]
  var body: some View {
    VStack {
      ScrollView {
        LazyVStack(spacing: 15) {
          ForEach(colors, id: \.self) { color in
            RoundedRectangle(cornerRadius: 20)
              .fill(color.gradient)
              .containerRelativeFrame(.vertical)
              .onScrollVisibilityChange(threshold: 0.5) { status in
                if status {
                  print("\(color) is Visiable")
                }
              }
          }
        }
        .padding(15)
        .scrollTargetLayout()
      }
      .scrollTargetBehavior(.viewAligned)
    }
  }
}

#Preview {
    OnScrollVisibilityChange()
}
