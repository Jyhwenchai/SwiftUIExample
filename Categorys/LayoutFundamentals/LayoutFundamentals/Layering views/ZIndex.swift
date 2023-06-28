//
//  ZIndex.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

/// `zIndex` 可以改变视图的层级顺序，默认为0
struct ZIndex: View {
    var body: some View {
      ZStack {
        Rectangle()
          .fill(Color.red)
          .frame(width: 100, height: 100)
        Rectangle()
          .fill(Color.green)
          .frame(width: 100, height: 100)
          .offset(x: 10.0, y: 10.0)
          .zIndex(1)
        Rectangle()
          .fill(Color.blue)
          .frame(width: 100, height: 100)
          .offset(x: 20.0, y: 20.0)
      }
    }
}

#Preview {
    ZIndex()
}
