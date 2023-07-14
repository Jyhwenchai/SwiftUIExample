//
//  OffsetReader.swift
//  MaterialCarousel
//
//  Created by 蔡志文 on 7/14/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
  static var defaultValue: CGFloat = 0

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    defaultValue = nextValue()
  }
}

extension View {
  @ViewBuilder
  func offsetX(completion: @escaping (CGFloat) -> Void) -> some View {
    self
      .overlay {
        GeometryReader { proxy in
          let minX = proxy.frame(in: .scrollView).minX
          Color.clear
            .preference(key: OffsetKey.self, value: minX)
            .onPreferenceChange(OffsetKey.self, perform: { value in
              completion(value)
            })
        }
      }
  }
}

extension [Card] {
  func indexOf(card: Card) -> Int {
    firstIndex(of: card) ?? 0
  }
}
