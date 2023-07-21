//
//  OffsetKey.swift
//  Task Management
//
//  Created by 蔡志文 on 7/19/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
