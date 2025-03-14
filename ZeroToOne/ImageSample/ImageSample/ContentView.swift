//
//  ContentView.swift
//  ImageSample
//
//  Created by 蔡志文 on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Form {
        Image(systemName: "globe")
          // 图片缩放调整
          .imageScale(.large)
          .foregroundStyle(.tint)
        Image(.image2)
          // 是否抗锯齿
          .antialiased(true)
          // 控制图片渲染的质量
          .interpolation(.low)
          .frame(width: 100, height: 100)
          // 图片适配模式
          .aspectRatio(contentMode: .fill)
          // 裁剪
          .clipShape(Circle())
        Image(.iconMeBill)
          // 图片渲染模式
          .renderingMode(.template)
          // 利用渲染模式可以修改图片颜色
          .foregroundStyle(Color.red)
        HStack {
          Image(systemName: "person")
          Image(systemName: "person")
            // symbol 图片的变体
            .symbolVariant(.fill)
        }

        HStack {
          Image(systemName: "bolt.slash.fill")
            .imageScale(.large)
          Image(systemName: "folder.fill.badge.person.crop")
            .imageScale(.large)
        }
        // symbol 动画效果
        .symbolEffect(.pulse)
      }
    }
}

#Preview {
    ContentView()
}

