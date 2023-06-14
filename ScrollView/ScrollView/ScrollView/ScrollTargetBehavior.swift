//
//  ScrollTargetBehavior.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// `scrollTargetBehavior` 定义了 `ScrollView` 滚动的行为
/// 值 `viewAligned` 定义了将滚动目标与基于视图的几何图形对齐的滚动行为。
/// 值 `paging` 定义了将滚动目标与基于容器的几何图形对齐的滚动行为(翻页效果)。
/// 值 `viewAligned(limitBehavior:)` 定义了滚动的对齐行为
/// - 值 `always` 效果与 `viewAligned` 相同
/// - 值 `never` 则表现出 `ScrollView` 默认的行为（即无滚动效果）
/// 我们也可以通过实现 `ScrollTargetBehavior` 协议自定义实现滚动的行为
struct ScrollTargetBehavior_: View {
  private struct Item: Identifiable {
    var id: String { text }
    let text: String
    let color: Color
  }

  @State private var items: [Item] = (0...30).map { Item(text: "item\($0)", color: Color.random) }
  @State private var scrolledID: Item.ID?

  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(items) { item in
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.orange)
            .frame(width: 140, height: 100)
            .overlay {
              Text(item.text)
            }
        }
      }
      .scrollTargetLayout()
    }
//    .scrollTargetBehavior(.viewAligned)
//    .scrollTargetBehavior(.paging)
//    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    .scrollTargetBehavior(BasicScrollTargetBehavior())
  }
}

#Preview {
  ScrollTargetBehavior_()
}

struct BasicScrollTargetBehavior: ScrollTargetBehavior {
  func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
    target.rect.origin.x = target.rect.origin.x + context.velocity.dx * context.containerSize.width
  }
}
