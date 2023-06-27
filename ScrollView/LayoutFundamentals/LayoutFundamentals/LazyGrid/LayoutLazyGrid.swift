//
//  LayoutLazyGrid.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

struct LayoutLazyGrid: View {
  var body: some View {
    List {
      ForEach(grids) { item in
        NavigationLink(destination: item.view) {
          Text(item.title)
        }
      }
    }
    .navigationTitle("Grid")
  }
}

#Preview {
  LayoutLazyGrid()
}

private let grids: [Feature] = [
  .init("LazyHGrid", LayoutLazyHGrid()),
  .init("LazyVGrid", LayoutLazyVGrid()),
  .init("GridItem", LayoutGridItem()),
  .init("GridItemSize", LayoutGridItemSize()),
]
