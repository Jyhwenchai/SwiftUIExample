//
//  ListDisclosureGroup.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

/// 可以使用 `disclosureGroupStyle` 自定义实现 `DisclosureGroup` 展开或折叠的动画
struct ListDisclosureGroup: View {
  var body: some View {
    List {
      DisclosureGroup("disclosure group") {
        ForEach(0..<5, id: \.self) { index in
          Text("Row: \(index)")
        }
      }
      .disclosureGroupStyle(MyDisclosureStyle())
    }
  }
}

#Preview {
    ListDisclosureGroup()
}

struct MyDisclosureStyle: DisclosureGroupStyle {
  func makeBody(configuration: Configuration) -> some View {
    VStack {
      Button {
        withAnimation {
          configuration.isExpanded.toggle()
        }
      } label: {
        HStack(alignment: .firstTextBaseline) {
          configuration.label
          Spacer()
          Text(configuration.isExpanded ? "hide" : "show")
            .foregroundColor(.accentColor)
            .font(.caption.lowercaseSmallCaps())
            .animation(nil, value: configuration.isExpanded)
        }
        .contentShape(Rectangle())
      }
      .buttonStyle(.plain)
      if configuration.isExpanded {
        configuration.content
      }
    }
  }
}
