//
//  ListEnvironment.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListEnvironment: View {
  @Environment(\.defaultMinListRowHeight) var defaultRowHeight: CGFloat
  @Environment(\.defaultMinListHeaderHeight) var defaultHeaderHeight: CGFloat?

  var body: some View {
    List {
      Section(header: Text("Header")) {
        ForEach(0..<5, id: \.self) { index in
          NavigationLink {
            EmptyView()
          } label: {
            Text("Row: \(index)")
              .badge(10)
          }
        }
      }
    }
    .listStyle(.insetGrouped)
  }
}

#Preview {
  NavigationStack {
    ListEnvironment()
      .environment(\.defaultMinListRowHeight, 100)
      .environment(\.defaultMinListHeaderHeight, 100) // 有一个最小值，最小不能小于这个值
      .environment(\.backgroundProminence, .increased)
      .environment(\.badgeProminence, .increased) // 突出 badge
  }
}
