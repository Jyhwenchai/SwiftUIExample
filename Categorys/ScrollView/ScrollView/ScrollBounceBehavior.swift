//
//  ScrollBounceBehavior_.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// `scrollBounceBehavior` 定义了 `ScrollView` 轴方向上的 bounce 的表现，
/// 当 `ScrollView` 的内容的尺寸不超过 `ScrollView` 本身的大小时，
/// 如果将值设置为 `basedOnSize`, 那么 `ScrollView` 将无法进行滚动。
struct ScrollBounceBehavior: View {
  @State var behavior: Int = 0
  var body: some View {
    VStack {
      Picker("Bounce Behavior", selection: $behavior) {
        Text("always").tag(0)
        Text("basedOnSize").tag(1)
      }
      .pickerStyle(.segmented)
      ScrollView {
        VStack {
          ForEach(0..<10, id: \.self) { index in
            Text("item: \(index)")
          }
        }
      }
      .scrollBounceBehavior(behavior == 0 ? .always : .basedOnSize)
    }
  }
}

#Preview {
  ScrollBounceBehavior()
}
