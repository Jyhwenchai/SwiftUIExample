//
//  LayoutGrid.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

struct LayoutGrid: View {
  var body: some View {
    List {
      ForEach(grids, id: \.0) { section in
        Section(section.0) {
          ForEach(section.1) { item in
            NavigationLink(destination: item.view) {
              Text(item.title)
            }
          }
        }
      }
    }
    .navigationTitle("Grid")
  }
}

#Preview {
    LayoutGrid()
}

private let grids: [(String, [Feature])] = [
  ("GridBasic", [
    .init("Basic", LayoutGridBasic()),
  ]),
  ("Configuring a grid", [
    .init("GridAlignemnt", GridAlignment()),
    .init("GridRowAlignemnt", GridRowAlignment()),
  ]),
  ("Configuring cells", [
    .init("GridColumnAlignemnt", GridColumnAlignmet()),
    .init("GridCellColumns", GridCellColumns()),
    .init("GridCellUnsizedAxes", GridCellUnsizedAxes()),
    .init("GridCellAnchor", GridCellAnchor()),
  ])
]
