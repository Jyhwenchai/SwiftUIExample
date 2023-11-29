//
//  RectKey.swift
//  DarkModeAnimation
//
//  Created by 蔡志文 on 11/28/23.
//

import SwiftUI

struct RectKey: PreferenceKey {
  static var defaultValue: CGRect = .zero
  static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
    value = nextValue()
  }
}
