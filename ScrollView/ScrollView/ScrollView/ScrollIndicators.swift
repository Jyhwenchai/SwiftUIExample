//
//  ScrollIndicators_.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// 可以控制 `ScrollView` 的指示器进行显示或隐藏

struct ScrollIndicators: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0..<40, id: \.self) { item in
          Text("item \(item)")
        }
      }
    }
    .scrollIndicators(.automatic)
    .scrollIndicators(.visible)
    .scrollIndicators(.never)
    // 隐藏水平和垂直方向的指示器
    .scrollIndicators(.hidden, axes: [.vertical, .vertical])
  }
}

#Preview {
  ScrollIndicators()
}
