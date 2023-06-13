//
//  ScrollContentBackground_.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// `scrollContentBackground` 属性可以设置隐藏滚动视图的背景，直接对 `ScrollView` 使用没有可见的效果，
/// 但是对于 `List`、`TextEditor` 这种可滚动的视图，它们都带有一个容器视图（content）,
/// 如果需要隐藏其 content 背景那么可以使用这个修改器通过设置为 `.hidden` 实现。
struct ScrollContentBackground: View {
  var body: some View {
    TabView {
      List {
        VStack {
          ForEach(0..<40, id: \.self) { item in
            Text("item \(item)")
          }
        }
      }
      .background(Color.orange.gradient)
      .scrollContentBackground(.hidden) // 设置 hidden 隐藏 List 中 content 的背景色
      .tabItem { Text("List") }

      TextEditor(text: .constant("Placeholder"))
        .padding()
        .background(Color.orange.gradient)
        .scrollContentBackground(.hidden)
        .tabItem { Text("TextEditor") }
    }
  }
}

#Preview {
  ScrollContentBackground()
}
