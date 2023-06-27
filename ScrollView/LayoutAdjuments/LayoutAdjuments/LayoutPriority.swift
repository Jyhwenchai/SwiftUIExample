//
//  LayoutPriority.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

/// `layoutPriority` 为视图添加布局的优先级，在父视图尺寸范围内，优先级高的视图优先占据有限的空间
struct LayoutPriority: View {
  var body: some View {
    HStack {
      Text("This is a moderately long string.")
        .font(.largeTitle)
        .border(Color.gray)


      Spacer()

      Text("This is a higher priority string.")
        .font(.largeTitle)
        .layoutPriority(1)
        .border(Color.gray)
    }
  }
}

#Preview {
  LayoutPriority()
}
