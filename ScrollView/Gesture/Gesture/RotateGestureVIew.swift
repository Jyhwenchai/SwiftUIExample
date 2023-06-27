//
//  RotateGesture.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

/// 识别旋转手势
/// 按住 `Alt` 键可进行手势
struct RotateGestureView: View {
  @State private var angle = Angle(degrees: 0)
  var rotation: some Gesture {
    RotateGesture()
      .onChanged { value in
        angle = value.rotation
      }
  }

  var body: some View {
    Rectangle()
      .fill(Color.orange)
      .frame(width: 200, height: 200)
      .rotationEffect(angle)
      .gesture(rotation)
  }
}

#Preview {
    RotateGestureView()
}
