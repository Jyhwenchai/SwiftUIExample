//
//  LayoutGridItemSize.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

/// 使用 `adaptive` 会改变所定义行或列的数量，使 `Grid` 可以放置最多数量的行或列
/// 使用 `.flexible` 行或列的宽度为：(容器的尺寸 - 总间距) / 行或列的数量
struct LayoutGridItemSize: View {
//  let columns = (1..<5).map { _ in GridItem(.adaptive(minimum: 40, maximum: 120), spacing: 10) }
  let columns = (1..<5).map { _ in GridItem(.flexible(minimum: 40, maximum: 120), spacing: 40) }
  var body: some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: columns, alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders], content: {
          ForEach(0..<50, id: \.self) { index in
            ZStack {
              RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.random.gradient)
              Text("Row:\(index)")
            }
            .frame(height: Double.random(in: 40..<100))
          }
      })
    }
  }
}

#Preview {
    LayoutGridItemSize()
}
