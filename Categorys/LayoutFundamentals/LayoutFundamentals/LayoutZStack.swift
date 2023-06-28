//
//  LayoutZStack.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

struct LayoutZStack: View {
  var body: some View {
    BackgroundView()
      .overlay(alignment: .topLeading) { box(".topLeading") }
      .overlay(alignment: .top) { box(".top") }
      .overlay(alignment: .topTrailing) { box(".topTrailing") }
      .overlay(alignment: .leading) { box(".leading") }
      .overlay(alignment: .center) { box(".center") }
      .overlay(alignment: .trailing) { box(".trailing") }
      .overlay(alignment: .bottomLeading) { box(".bottomLeading") }
      .overlay(alignment: .bottom) { box(".bottom") }
      .overlay(alignment: .bottomTrailing) { box(".bottomTrailing") }
      .overlay(alignment: .leadingLastTextBaseline) { box(".leadingLastTextBaseline") }
      .overlay(alignment: .trailingFirstTextBaseline) { box(".trailingFirstTextBaseline") }
  }

  func box(_ name: String) -> some View {
    Text(name)
      .font(.system(.caption, design: .monospaced))
      .padding(2)
      .foregroundColor(.white)
      .background(.blue.opacity(0.8), in: Rectangle())
  }
}

struct BackgroundView: View {
  var body: some View {
    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
      GridRow {
        Text("Some text in an upper quadrant")
        Color.gray.opacity(0.3)
      }
      GridRow {
        Color.gray.opacity(0.3)
        Text("More text in a lower quadrant")
      }
    }
    .aspectRatio(1, contentMode: .fit)
    .foregroundColor(.secondary)
    .border(.gray)
  }
}

#Preview {
  LayoutZStack()
}
