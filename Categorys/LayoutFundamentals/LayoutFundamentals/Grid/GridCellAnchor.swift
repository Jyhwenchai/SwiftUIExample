//
//  GridCellAnchor.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI
/// `gridCellAnchor` 可以为自身所在的单元格内提供对齐的位置。
struct GridCellAnchor: View {
  var body: some View {
    Grid(horizontalSpacing: 1, verticalSpacing: 1) {
      GridRow {
        Color.red.frame(width: 60, height: 60)
        Color.red.frame(width: 60, height: 60)
        Color.red.frame(width: 60, height: 60)
      }
      GridRow {
        Color.red.frame(width: 40, height: 40)  // 默认在自身的网格内是居中对齐
        Color.blue.frame(width: 10, height: 10)
          .gridCellColumns(2)
          .gridCellAnchor(UnitPoint(x: 0.5, y: 0.8))
      }
      .gridCellAnchor(UnitPoint(x: 0.5, y: 0.5))
    }
  }
}

#Preview {
  GridCellAnchor()
}
