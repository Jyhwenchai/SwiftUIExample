//
//  LayoutVStack.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

/// 对齐的计算方式是：(取最大视图的宽度 - 每个视图的宽度) / defaultValue
struct LayoutVStack: View {
  @State private var alignment: Alignment = .center
  private enum Alignment: Identifiable {
    case leading
    case center
    case trailing
    case oneQuarter
    case listRowSeparatorLeading
    case listRowSeparattorTrailing
    var id: Self { self }

    var value: HorizontalAlignment {
      switch self {
      case .leading: .leading
      case .center: .center
      case .trailing: .trailing
      case .oneQuarter: .oneQuarter
      case .listRowSeparatorLeading: .listRowSeparatorLeading
      case .listRowSeparattorTrailing: .listRowSeparatorTrailing
      }
    }
  }

  var body: some View {
    VStack {
      Picker("Alignment", selection: $alignment) {
        Text("leading").tag(Alignment.leading)
        Text("center").tag(Alignment.center)
        Text("trailing").tag(Alignment.trailing)
        Text("oneQuarter").tag(Alignment.oneQuarter)
      }
      .pickerStyle(.segmented)

      ZStack {
        VStack(alignment: alignment.value) {
          Color.red.frame(width: 20, height: 1)
          Text("Top")
            .frame(width: 40)
            .background(Color.random)
          Text("Center")
            .frame(width: 80)
            .background(Color.random)
          Text("Bottom")
            .frame(width: 120)
            .background(Color.random)
          Color.red.frame(width: 20, height: 1)
        }
        .foregroundStyle(Color.white)
        .frame(height: 150)
        .containerRelativeFrame(.horizontal)
        .background(Color.accentColor.gradient)

        ForEach(1..<4) { index in
          Color.orange.frame(width: 1, height: 150)
            .offset(x: CGFloat(-20 * index))
        }
      }

      List {
        ForEach(0..<4) { index in
          let text = "Hello, World"
          HStack {
            Text(String(text[text.startIndex..<text.index(text.startIndex, offsetBy: Int.random(in: 1..<10))]))
            Text("Row:\(index)")
              .font(.system(size: 40))
              .alignmentGuide(.listRowSeparatorLeading) {
                $0[.leading]  // separator 的 leading 对齐当前视图的 leading
              }
//              .alignmentGuide(.listRowSeparatorTrailing) {
//                $0[.leading]  // separator 的 Trailing 对齐当前视图的 leading
//              }
          }
        }
      }
    }
  }
}

#Preview {
    LayoutVStack()
}

struct OneQuarterAlignment: AlignmentID {
   static func defaultValue(in context: ViewDimensions) -> CGFloat {
     return context.width / 4
   }
}

extension HorizontalAlignment {
  static let oneQuarter = HorizontalAlignment(OneQuarterAlignment.self)
}
