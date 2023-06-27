//
//  MagnifyGesture_.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

/// 识别放大手势，当用手指进行捏合缩放时会触发该手势
/// 按住 `Alt` 键可进行手势
struct MagnifyGestureView: View {
  @GestureState private var magnifyBy = 1.0
  var magnification: some Gesture {
    MagnifyGesture()
      .updating($magnifyBy) { value, state, transaction in
        state = value.magnification
      }
  }
  
    var body: some View {
      Circle()
        .frame(width: 100, height: 100)
        .scaleEffect(magnifyBy)
        .gesture(magnification)
    }
}

#Preview {
    MagnifyGestureView()
}
