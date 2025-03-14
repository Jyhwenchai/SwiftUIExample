//
//  ContentView.swift
//  LabelSample
//
//  Created by 蔡志文 on 1/7/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Form {
      Section("初始化") {
        Label {
          Text("Hello, World!")
        } icon: {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        }
        Label("Lightning", systemImage: "bolt.fill")
        Label("Hello", image: "checked")
        Label("Hello", image: "checked")
          .labelStyle(.iconOnly)
      }

      Section("Label Style") {
        Label("Hello", image: "checked")
          .labelStyle(RedBorderedLabelStyle())
          .labelStyle(.redBordered)
      }

      Section("更丰富的自定义") {
        Label {
          Text("Hello,")
          Text("World!")
        } icon: {
          Circle()
            .fill(Color.accentColor)
            .frame(width: 44, height: 44, alignment: .center)
            .overlay(
              Text("globe")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.orange)
            )
        }
      }


      Section("外观调整") {
        Label("Lightning", systemImage: "bolt.fill")
        /// 修改外观颜色
          .foregroundStyle(Color.mint)
        /// 修改字体
          .font(.caption)
      }
    }
  }
}

#Preview {
  ContentView()
}

struct RedBorderedLabelStyle: LabelStyle {
  /// typealias Configuration = LabelStyleConfiguration
  func makeBody(configuration: Configuration) -> some View {
    Label(configuration)
      .border(Color.red)
  }
}

extension LabelStyle where Self == RedBorderedLabelStyle {
  @MainActor @preconcurrency
  static var redBordered: RedBorderedLabelStyle { RedBorderedLabelStyle() }
}
