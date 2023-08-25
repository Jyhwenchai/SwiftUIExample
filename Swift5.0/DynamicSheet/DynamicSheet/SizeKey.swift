//
//  SizeKey.swift
//  DynamicSheet
//
//  Created by 蔡志文 on 8/25/23.
//

import SwiftUI

struct SizeKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    defaultValue = nextValue()
  }
}
