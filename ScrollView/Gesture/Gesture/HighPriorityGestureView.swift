//
//  HighPriorityGestureView.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

/// 将手势附加到视图，其优先级高于视图定义的手势。
struct HighPriorityGestureView: View {
  @State private var message = "Message"
  let newGesture = TapGesture().onEnded {
    print("Tap on VStack.")
  }


  var body: some View {
    VStack(spacing:25) {
      Image(systemName: "heart.fill")
        .resizable()
        .frame(width: 75, height: 75)
        .padding()
        .foregroundColor(.red)
        .onTapGesture {
          print("Tap on image.")
        }
      Rectangle()
        .fill(Color.blue)
    }
    .highPriorityGesture(newGesture)
    .frame(width: 200, height: 200)
    .border(Color.purple)
  }
}

#Preview {
  HighPriorityGestureView()
}
