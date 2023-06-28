//
//  DragGesture_.swift
//  Gesture
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI

struct DragGestureView: View {
  @State var offset: CGPoint = .zero
  @State var position = CGSize.zero
  @State var color: Color = .green
  var gesture: some Gesture {
    DragGesture()
      .onChanged { value in
        let translation = value.translation
        offset = CGPoint(x: translation.width, y: translation.height)
      }
      .onEnded { value in
        offset = .zero
        position += value.translation
      }
  }

  var body: some View {
    VStack {
      Circle()
        .fill(color)
        .frame(width: 100)
        .offset(x: offset.x + position.width, y: offset.y + position.height)
        .gesture(gesture)
    }
  }
}

#Preview {
  DragGestureView()
}

func += (lhs: inout CGSize, rhs: CGSize) {
  lhs.width += rhs.width
  lhs.height += rhs.height
}
