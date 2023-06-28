//
//  ScrollTransition.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// `scrollTransition` 可以对 `ScrollView` 子视图应用动画
/// 其中参数 `ScrollTransitionConfiguration` 定义了子视图在穿过可见区域时的动画方式
/// 值 `animated` 当视图变得可见时，该配置进行离散地过度效果。
/// 值 `identity` 不更改视图外观
/// 值 `interactive` 在视图滚动到容器的可见区域时交互式地插入过渡效果。
struct ScrollTransition: View {
  private struct Item: Identifiable {
    var id: String { text }
    let text: String
    let color: Color
  }

  @State private var items: [Item] = (0...30).map { Item(text: "item\($0)", color: Color.random) }

  var body: some View {
    ScrollView(.vertical) {
      VStack {
        ForEach(items) { item in
          RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .fill(Color.orange)
            .frame(width: 140, height: 100)
            .overlay {
              Text(item.text)
            }
//            .scrollTransition(.interactive, axis: .vertical) { effect, phase in
//              effect
//                .opacity(1 - abs(phase.value))
//                .scaleEffect(CGSize(width: 1 - abs(phase.value), height: 1 - abs(phase.value)))
//            }
            .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive, axis: .vertical) { effect, phase in
              effect
                .opacity(1 - abs(phase.value))
                .scaleEffect(CGSize(width: 1 - abs(phase.value), height: 1 - abs(phase.value)))
            }
        }
      }
    }
  }
}

#Preview {
  ScrollTransition()
}
