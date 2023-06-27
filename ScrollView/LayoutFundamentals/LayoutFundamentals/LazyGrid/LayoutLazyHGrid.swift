//
//  LayoutLazyHGrid.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

/// `LazyHGrid` 可以定义水平方向的网格布局
/// 此时 `GridItem` 定义了有多少行以及每行的高度
struct LayoutLazyHGrid: View {
  // 定义了四行，每行的高度为 .fixed 类型
  let rows = (1..<5).map { GridItem(.fixed(30 * Double($0))) }
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rows, alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders], content: {
        Section {
          ForEach(0..<50, id: \.self) { index in
            ZStack {
              RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.random.gradient)
                .frame(width: 60) // 这里不指定具体高度，因为在 GridItem 中已经指明
              Text("Row:\(index)")
            }
          }
        } header: {
          ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
              .fill(Color.random)
            Text("Header")
          }
          .frame(height: 200)
        }
      })
    }
  }
}

#Preview {
  LayoutLazyHGrid()
}
