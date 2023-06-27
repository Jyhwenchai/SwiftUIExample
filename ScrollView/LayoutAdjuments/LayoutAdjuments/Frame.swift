//
//  Frame.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

struct Frame: View {
    var body: some View {
      VStack {
        Text("Hello, World!")
        Text("QWERTYUIOPASDFGHJKLZXCVBNM")
        /// 可用该修改器为视图设置弹性的尺寸
          .frame(maxWidth: 140, alignment: .trailing)
      }
      .frame(width: 200, height: 500, alignment: .leading)
      .border(Color.black)
    }
}

#Preview {
    Frame()
}
