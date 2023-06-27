//
//  ContainerRelativeFrame.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

struct ContainerRelativeFrame: View {
  var body: some View {
    Text("Hello, World!")
    /// 可以设置视图尺寸为容器的宽度和高度
      .containerRelativeFrame([.horizontal, .vertical])
      .border(Color.black)
  }
}

#Preview {
  ContainerRelativeFrame()
}
