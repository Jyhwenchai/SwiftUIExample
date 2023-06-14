//
//  ListGroup.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListOutlineGroup: View {

  struct Node: Identifiable {
    let text: String
    let children: [Node]?

    var id: String { text }
  }

  let nodes: [Node] = [
    .init(text: "A", children: nil),

      .init(text: "B", children: [
        .init(text: "B1", children: nil),
        .init(text: "B2", children: nil),
        .init(text: "B3", children: [
          .init(text: "B3a", children: nil),
          .init(text: "B3b", children: nil)
        ])
      ]),

      .init(text: "C", children: [
        .init(text: "C1", children: nil),
        .init(text: "C2", children: nil),
        .init(text: "C3", children: nil)
      ]),
  ]

  var body: some View {
    List {
      OutlineGroup(nodes, children: \.children) { item in
        Text(item.text)
      }
    }
  }
}

#Preview {
  ListOutlineGroup()
}

