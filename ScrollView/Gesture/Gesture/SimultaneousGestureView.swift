//
//  SimultaneousGestureView.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

/// 组合手势，`SimultaneousGesture` 多个手势可以同时被识别
/// 下面的示例中同时识别了 `MagnifyGesture` 和 `RotateGesture`
struct SimultaneousGestureView: View {
  @GestureState private var magnifyBy = 1.0
  var magnification: some Gesture {
    MagnifyGesture()
      .updating($magnifyBy) { value, state, transaction in
        state = value.magnification
      }
  }

  @State private var angle = Angle(degrees: 0)
  var rotation: some Gesture {
    RotateGesture()
      .onChanged { value in
        angle = value.rotation
      }
  }

  var body: some View {
    let groupGesture = magnification.simultaneously(with: rotation)
    Rectangle()
      .fill(Color.orange)
      .frame(width: 130, height: 130)
      .scaleEffect(magnifyBy)
      .rotationEffect(angle)
      .gesture(groupGesture)
  }
}

#Preview {
  SimultaneousGestureView()
}
