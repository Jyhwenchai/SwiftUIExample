//
//  LayoutLazyVGrid.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

/// `LazyVGrid` 可以定义垂直方向的网格布局
/// 此时 `GridItem` 定义了有多少行以及每行的高度
struct LayoutLazyVGrid: View {
  // 定义了四列，每行的高度为 .fixed 类型
  let columns = (1..<5).map { GridItem(.fixed(30 * Double($0)), spacing: 10) }
  var body: some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: columns, alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders], content: {
        Section {
          ForEach(0..<50, id: \.self) { index in
            ZStack {
              RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.random.gradient)
                .frame(height: 60) // 这里不指定具体宽度，因为在 GridItem 中已经指明
              Text("Row:\(index)")
            }
          }
        } header: {
          ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
              .fill(Color.random)
            Text("Header")
          }
          .frame(height: 40)
        }
      })
    }
  }
}

#Preview {
    LayoutLazyVGrid()
}
