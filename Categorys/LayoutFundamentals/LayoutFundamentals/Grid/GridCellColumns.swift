//
//  GridCellColumns.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

struct GridCellColumns: View {

  @State private var numberOfColumn: Int = 1
  var body: some View {
    VStack {

      Picker("Column", selection: $numberOfColumn) {
        Text("1").tag(1)
        Text("2").tag(2)
        Text("3").tag(3)
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
            .frame(width: 130, height: 60)
            .gridCellColumns(numberOfColumn)
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
            .frame(width: 130, height: 60)
            .gridCellColumns(numberOfColumn)
        }
      }
    }
  }
}

#Preview {
  GridCellColumns()
}
