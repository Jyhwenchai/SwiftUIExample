//
//  ExclusiveGestureView.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

/// 组合手势，由两个手势组成的手势，其中只有一个可以成功
/// `ExclusiveGesture` 会优先考虑第一个手势，如果一个手势识别成功，则另外一个手势将不会被识别
struct ExclusiveGestureView: View {

  @State var offset: CGPoint = .zero
  @State var position = CGSize.zero
  @State var color: Color = .green
  @State var isDrag: Bool = false
  var dragGesture: some Gesture {
    DragGesture()
      .onChanged { value in
        let translation = value.translation
        offset = CGPoint(x: translation.width, y: translation.height)
        isDrag = true
      }
      .onEnded { value in
        offset = .zero
        position += value.translation
      }
  }

  @State var isPressed: Bool = false
  var longPresssGesture: some Gesture {
    LongPressGesture()
      .onEnded { _ in
          isPressed = true
      }
  }

  var body: some View {
    let groupGesture = longPresssGesture.exclusively(before: dragGesture)
    VStack {
      Text( isDrag ? "User is Draging" : (isPressed ? "User is Pressed" : "No Gesture"))
      Circle()
        .fill(Color.orange)
        .frame(width: 100)
        .offset(x: offset.x + position.width, y: offset.y + position.height)
        .gesture(groupGesture)
      Button("reset") {
        isDrag = false
        isPressed = false
      }
    }

  }
}

#Preview {
    ExclusiveGestureView()
}
