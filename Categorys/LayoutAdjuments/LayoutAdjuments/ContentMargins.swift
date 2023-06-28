//
//  ContentMargins.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

/// `contentMargins` 为容器视图添加外边距，于 `padding` 不同的是 `contentMargins` 的边距不会被占用，是可见的
struct ContentMargins: View {

  @State var text: String = "You can provide a ContentMarginPlacement to target specific parts of a view to customize. For example, provide a ContentMargingPlacement/scrollContent placement to inset the content of a TextEditor without affecting the insets of its scroll indicators."

  var body: some View {
    VStack {
      ScrollView(.horizontal) {
        HStack {
          ForEach(0..<5) { index in
            RoundedRectangle(cornerRadius: 20)
              .fill(Color.random.gradient)
              .frame(width: 60, height: 40)
          }
        }
      }
//      .contentMargins(.horizontal, 20.0)
      .contentMargins(20.0, for: .scrollIndicators)
      //      .padding(.horizontal, 20) // 对比区别
      .border(Color.orange)

      TextEditor(text: $text)
        .frame(height: 84)
        .contentMargins(.all, 20.0, for: .scrollContent)
        .border(Color.black, width: 1)
    }
  }
}

#Preview {
  ContentMargins()
}
