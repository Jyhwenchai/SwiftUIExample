//
//  ScrollPosition.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// `scrollPosition(id:)` 与 `scrollTargetLayout` 配合使用，它适用与列表中元素相同的情况下
/// `scrollTargetLayout` 指定了那一部分的视图是可以滚动的区域
/// `scrollPosition(id:)` 指定滚动到所管理的id
/// `scrollPosition(initialAnchor)` 指定一开始滚动视图所滚动的位置（top/center/bottom等等）
struct ScrollPosition: View {

  private struct Item: Identifiable {
    var id: String { text }
    let text: String
    let color: Color
  }

  @State private var items: [Item] = (0...30).map { Item(text: "item\($0)", color: Color.random) }
  @State private var scrolledID: Item.ID?

  var body: some View {
    VStack {
      Button("Random scrolledID: \(scrolledID ?? "unset")") {
        // 可以应用动画
        withAnimation(.linear) {
          scrolledID = items.randomElement()?.id
        }
      }
      ScrollView {
        LazyVStack {
          ForEach(items) { item in
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
              .fill(Color.orange)
              .frame(width: 100, height: 100)
              .overlay {
                Text(item.text)
              }
          }
        }
        .scrollTargetLayout()
      }
      // 必须处于 `scrollPosition(id:)` 之前使用否则无效
//      .scrollPosition(initialAnchor: .bottom)
      // 与 `scrollPosition(initialAnchor:)` 二者只有一个可以生效
      .scrollPosition(id: $scrolledID)
    }
  }
}

#Preview {
    ScrollPosition()
}
