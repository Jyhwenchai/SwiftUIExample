//
//  SpatialTapGesture.swift
//  Gesture
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI

struct SpatialTapGestureView: View {
    var body: some View {
      SpatialTapGestureExample1()
    }
}

struct SpatialTapGestureExample1: View {
  @State private var location: CGPoint = .zero

  var tap: some Gesture {
    SpatialTapGesture()
      .onEnded { event in
        self.location = event.location
        print(self.location)
      }
  }

  var body: some View {
    Circle()
      .fill(self.location.y > 50 ? Color.blue : Color.red)
      .frame(width: 100, height: 100, alignment: .center)
      .gesture(tap)
  }
}

#Preview {
    SpatialTapGestureView()
}
