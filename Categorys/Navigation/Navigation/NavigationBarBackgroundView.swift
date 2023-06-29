//
//  NavigationBarBackground.swift
//  Navigation
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

/// `NavigationBar` 的风格配置
struct NavigationBarBackgroundView: View {
  @State private var text: String = "hello"
  var body: some View {
    NavigationStack {
      List {
        ForEach(0..<20, id: \.self) { index in
          Text("Cell \(index)")
        }
      }
      .navigationTitle("List")
      // 隐藏 navigationBar
      .toolbar(.hidden, for: .navigationBar)
      .toolbar(.visible, for: .navigationBar)
      // 改变导航栏的背景色
      .toolbarBackground(Color.pink, for: .navigationBar)
      // 改变导航栏的整体色彩模式
      .toolbarColorScheme(ColorScheme.dark, for: .navigationBar)
      // title menu
      .toolbarTitleMenu {
        Group {
          Text("Menu1")
          Text("Menu2")
          Text("Menu3")
        }
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Text("Left Item")
        }
        ToolbarItemGroup(placement: .topBarTrailing) {
          Text("Item1")
          Text("Item2")
        }
      }
    }
  }
}

#Preview {
  NavigationBarBackgroundView()
}
