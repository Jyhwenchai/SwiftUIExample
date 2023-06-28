//
//  ScrollClipDisabled_.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// 默认的在 `ScrollView` 尺寸范围外的内容是不可见的，但是可以使用 `scrollClipDisabled` 改变这个情况。
struct ScrollClipDisabled: View {
  var body: some View {
    VStack {
      ScrollView {
        VStack {
          ForEach(0..<40, id: \.self) { index in
            Text("item: \(index)")
          }
        }
      }
      .frame(height: 500)
      .background(Color.orange)
      .border(Color.blue, width: 1)
      .shadow(color: Color.orange, radius: 20, x: 0.0, y: 0.0)
      .scrollClipDisabled(true)
    }
  }
}

#Preview {
  ScrollClipDisabled()
}
