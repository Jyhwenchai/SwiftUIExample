//
//  LayoutLazyGridItem.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

/// `GridItem` 定义了 `LazyHGrid` 和 `LazyVGrid` 中对应行或列的基本配置
/// 包括 1.尺寸（如果是 LazyHGrid 则是高度，LazyVGrid 则是宽度）
/// 2. 行或列中元素的间距
/// 4. 行或列中元素的对齐方式（只有当行或列中的元素大小不一致时才有效果，如果每行或每一列中的元素大小都相同那么对齐也就没有意义）
struct LayoutGridItem: View {

  // 这里让每一行的元素 top 对齐，由于这里每个元素的宽度都等于了配置的宽度，所以无法应用水平方向的对齐值（如：leading）
  // 只有当元素的宽度不等于配置的宽度时，那么应用水平方向的对齐值才有意义
  let columns = (1..<5).map { GridItem(.fixed(30 * Double($0)), spacing: 10, alignment: .top) }
  var body: some View {
    ScrollView(.vertical) {
      LazyVGrid(columns: columns, alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders], content: {
          ForEach(0..<50, id: \.self) { index in
            ZStack {
              RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.random.gradient)
              Text("Row:\(index)")
            }
            // 这里不指定具体宽度，因为在 GridItem 中已经指明
            .frame(height: Double.random(in: 40..<100))
          }
      })
    }
  }
}

#Preview {
    LayoutGridItem()
}
