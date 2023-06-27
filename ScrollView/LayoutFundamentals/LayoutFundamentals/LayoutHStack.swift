//
//  LayoutStack.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct LayoutHStack: View {
  @State private var alignment: Alignment = .center
  private enum Alignment: Identifiable {
    case top
    case center
    case bottom
    case firstTextBaseline
    case lastTextBaseline
    var id: Self { self }

    var value: VerticalAlignment {
      switch self {
      case .top: .top
      case .center: .center
      case .bottom: .bottom
      case .firstTextBaseline: .firstTextBaseline
      case .lastTextBaseline: .lastTextBaseline
      }
    }
  }

  var body: some View {
    VStack {
      Picker("Alignment", selection: $alignment) {
        Text("top").tag(Alignment.top)
        Text("center").tag(Alignment.center)
        Text("bottom").tag(Alignment.bottom)
        Text("firstTextBaseline").tag(Alignment.firstTextBaseline)
        Text("lastTextBaseline").tag(Alignment.lastTextBaseline)
      }
      .pickerStyle(.segmented)

      HStack(alignment: alignment.value) {
        Color.red.frame(width: 30, height: 1)
        Text("Top\nTop")
          .background(Color.random)
        Text("Center")
          .background(Color.random)
          .font(.caption)
        Text("Bottom\nBottom\nBottom")
          .background(Color.random)
        Color.red.frame(width: 30, height: 1)
      }
      .foregroundStyle(Color.white)
      .frame(height: 100)
      .containerRelativeFrame(.horizontal)
      .background(Color.accentColor.gradient)
    }
  }
}

#Preview {
  LayoutHStack()
}
