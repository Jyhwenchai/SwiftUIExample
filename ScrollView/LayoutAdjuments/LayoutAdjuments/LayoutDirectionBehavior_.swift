//
//  LayoutDirectionBehavior_.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/20/23.
//

import SwiftUI
/// `layoutDirectionBehavior` 为不同的布局方向设置此视图的行为。
struct LayoutDirectionBehavior_: View {
  var body: some View {
    Text("Hello, World!")
      .layoutDirectionBehavior(.mirrors)
  }
}

#Preview {
  LayoutDirectionBehavior_()
}
