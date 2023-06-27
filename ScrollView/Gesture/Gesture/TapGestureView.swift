//
//  TapGesture_.swift
//  Gesture
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI

struct TapGestureView: View {
  var body: some View {
    VStack {
      TapGestureExample1()
      TapGestureExample2()
      TapGestureExample3()
    }
  }
}

fileprivate struct TapGestureExample1: View {
  let colors: [Color] = [.gray, .red, .orange, .yellow,
                         .green, .blue, .purple, .pink]
  @State private var fgColor: Color = .gray

  var body: some View {
    Image(systemName: "heart.fill")
      .resizable()
      .frame(width: 200, height: 200)
      .foregroundColor(fgColor)
      .onTapGesture(count: 2) {
        fgColor = colors.randomElement()!
      }
  }
}

/// 通过指定 `coordinateSpace` 指明参考的坐标空间
fileprivate struct TapGestureExample2: View {
  let colors: [Color] = [.gray, .red, .orange, .yellow,
                         .green, .blue, .purple, .pink]
  @State private var fgColor: Color = .gray
  @State private var mediumColor: Color = .red
  @State private var minColor: Color = .blue

  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: 200, height: 200)
        .foregroundColor(fgColor)
        .onTapGesture(count: 2, coordinateSpace: .named("custom")) { location in
          fgColor = colors.randomElement()!
          print(location)
        }
    }
    .frame(width: 300, height: 300)
    .coordinateSpace(.named("custom"))
    .border(Color.red, width: 1)
  }
}

fileprivate struct TapGestureExample3: View {
  let colors: [Color] = [.gray, .red, .orange, .yellow,
                         .green, .blue, .purple, .pink]
  @State private var fgColor: Color = .gray

  var tap: some Gesture {
    TapGesture(count: 2)
      .onEnded { location in
        fgColor = colors.randomElement()!
        print(location)
      }
  }

  var body: some View {
    Rectangle()
      .frame(width: 200, height: 200)
      .foregroundColor(fgColor)
      .gesture(tap)
  }
}

#Preview {
    TapGestureView()
}
