//
//  ScrollPosition.swift
//  OnScrollGeometryChnage
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI

/**
 - ScrollPosition

 Last year we got the ScrollPosition modiifer, which will let us know the scroll position by the ID type，but now it's updated with more advanced features such as programmatic scrolling.
 */
struct ScrollPositionChange: View {
  var colors: [Color] = [.red, .blue, .green, .yellow, .purple, .cyan, .brown, .black, .indigo]
  @State private var position: ScrollPosition = ScrollPosition(idType: Color.self)

  var body: some View {
    VStack {
      Button("Move") {
        withAnimation {
          position.scrollTo(y: 550)
        }
      }
      VStack {
        ScrollView {
          LazyVStack(spacing: 10) {
            ForEach(colors, id: \.self) { color in
              RoundedRectangle(cornerRadius: 15)
                .fill(color.gradient)
                .frame(height: 220)
            }
          }
          .padding(15)
          .scrollTargetLayout()
        }
        .scrollPosition($position)
      }
    }
  }
}

#Preview {
  ScrollPositionChange()
}
