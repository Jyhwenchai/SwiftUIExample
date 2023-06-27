//
//  GestureMask.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

/// `GestureMask.all` 会使当前视图以及其子视图的手势有效，父视图手势无效
/// `GestureMask.gesture` 会使当前视图的手势有效，但子视图及父视图手势失效
/// `GestureMask.none` 会使父视图的手势有效，但当前视图的手势及其子视图的手势失效
/// `GestureMask.subViews` 会使其子视图手势有效，但当前视图的手势及其父视图手势失效

struct GestureMaskView: View {
  var body: some View {
    VStack {
      VStack {
        Text("Hello, World!")
          .font(.largeTitle)
          .onTapGesture {
            print("Third Gesture Action")
          }
      }
      .simultaneousGesture (
        TapGesture()
          .onEnded {
            print("Second Gesture Action")
          }, including: GestureMask.none
      )
    }
    .onTapGesture {
      print("First Gesture Action")
    }
  }
}

#Preview {
  GestureMaskView()
}
