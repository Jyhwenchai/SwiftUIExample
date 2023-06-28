//
//  GridCellUnsizedAxes.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

/// `gridCellUnsizedAxes` 可以避免视图在未定义尺寸时扩展尺寸占用额外的空间
struct GridCellUnsizedAxes: View {

  @State private var numberOfColumn: Int = 1
  @State private var axes: UnsizedAxes = .none

  private enum UnsizedAxes: String, Identifiable, CaseIterable {
    case none
    case horizontal
    case vertical
    case horizontalAndVertical

    var id: Self { self }
    var value: Axis.Set {
      switch self {
      case .none: []
      case .horizontal: .horizontal
      case .vertical: .vertical
      case .horizontalAndVertical: [.horizontal, .vertical]
      }
    }
  }

  var body: some View {
    VStack {

      Picker("Column", selection: $numberOfColumn) {
        Text("1").tag(1)
        Text("2").tag(2)
        Text("3").tag(3)
      }
      .pickerStyle(.segmented)

      Picker("UnsizedAxes", selection: $axes) {
        ForEach(UnsizedAxes.allCases) { item in
          Text(item.rawValue).tag(item)
        }
      }
      .pickerStyle(.segmented)

      Grid(alignment: .leadingFirstTextBaseline) {
        GridRow {
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
        }
        GridRow {
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
        }

        GridRow {
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
//            .frame(width: 130, height: 60)  // 不设置尺寸
            .gridCellColumns(numberOfColumn)
            .gridCellUnsizedAxes(axes.value)
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
        }

        GridRow {
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.random.gradient)
            .frame(width: 60, height: 60)
        }
      }
    }
  }
}

#Preview {
  GridCellUnsizedAxes()
}
