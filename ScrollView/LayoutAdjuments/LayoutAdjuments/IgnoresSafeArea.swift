//
//  IgnoresSafeArea.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/20/23.
//

import SwiftUI
/// [safe area guide](https://fatbobman.medium.com/mastering-safe-area-in-swiftui-a183b8ad04d0)
/// `ignoresSafeArea` 有三中忽略安全区域的类型
/// `all` 包含以下两种类型
/// `container` 容器类型，指定为该类型时，容器的安全区域将被忽略
/// `keyboard` 键盘类型，指定为该类型时，如果存在键盘，则键盘的区域将被忽略，那么输入框将被键盘遮挡
struct IgnoresSafeArea: View {
  @State var text: String = ""
  var body: some View {
    TabView {
      ZStack {
        Color.orange
        Text("Hello, World!")
      }
      .ignoresSafeArea()  // ignore safeArea
      .tabItem { Text("Basic") }

      ScrollView {
        ZStack {
          Color.teal
          VStack {
            Spacer()
              .frame(height: 300)
            TextField("placeholder", text: $text)
              .padding()
              .border(.red, width: 1)
              .padding()
          }
        }
        .containerRelativeFrame([.vertical, .horizontal])
      }
      .ignoresSafeArea(.container, edges: .all)   // 不会遮挡键盘
      .scrollDismissesKeyboard(.immediately)
      .tabItem { Text("Keyboard") }
    }
  }
}

#Preview {
  IgnoresSafeArea()
}
