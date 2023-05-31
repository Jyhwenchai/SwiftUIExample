//
//  ScrollOffset.swift
//  ITime
//
//  Created by 蔡志文 on 5/9/23.
//

import SwiftUI

extension View {
  @ViewBuilder
  func offsetX(completion: @escaping (CGRect) -> Void) -> some View {
    self
      .overlay {
        GeometryReader { proxy in
          let rect = proxy.frame(in: .global)
          Color.clear
            .preference(key: OffsetKey.self, value: rect)
            .onPreferenceChange(OffsetKey.self, perform: completion)
        }
      }
  }
}

struct OffsetKey: PreferenceKey {
  static var defaultValue: CGRect = .zero
  static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
    value = nextValue()
  }
}

struct TabItemWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
