//
//  ContentView.swift
//  ButtonsSample
//
//  Created by 蔡志文 on 1/10/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Form {
      Section("Button") {
        Button("Button") {
        }
        Button {} label: {
          Text("Button")
        }
        HStack {
          Text("role:")
          Button("Destructive", role: .destructive, action: {})
          Button("Cancel", role: .cancel, action: {})
        }
        Button("left Image right Text Button", systemImage: "globe", action: {})
        Button("role and image", systemImage: "globe", role: .destructive, action: {})
        // 按钮样式
          .buttonStyle(.bordered)
        // 按钮形状
          .buttonBorderShape(.capsule)
        Button("test repeat action") {
          print("action")
        }
        // 设置此视图中的按钮是否应该在长时间交互时重复触发它们的操作。
        .buttonRepeatBehavior(.disabled)
      }
    }
  }
}

#Preview {
    ContentView()
}
