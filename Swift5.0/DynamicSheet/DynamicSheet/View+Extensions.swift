//
//  View+Extensions.swift
//  DynamicSheet
//
//  Created by 蔡志文 on 8/25/23.
//

import SwiftUI

extension View {
  @ViewBuilder
  func heightChangePreference(completion: @escaping (CGFloat) -> Void) -> some View {
    self
      .overlay {
        GeometryReader { geometry in
          Color.clear
            .preference(key: SizeKey.self, value: geometry.size.height)
            .onPreferenceChange(SizeKey.self, perform: { value in
              completion(value)
            })
        }
      }
  }

  @ViewBuilder
  func minXChangePreference(completion: @escaping (CGFloat) -> Void) -> some View {
    self
      .overlay {
        GeometryReader { geometry in
          Color.clear
            .preference(key: OffsetKey.self, value: geometry.frame(in: .scrollView).minX)
            .onPreferenceChange(OffsetKey.self, perform: { value in
              completion(value)
            })
        }
      }
  }
}

