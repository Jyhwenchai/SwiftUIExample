//
//  LinearInterpolation.swift
//  ITime
//
//  Created by 蔡志文 on 5/9/23.
//

import SwiftUI

class LinearInterpolation {
  let length: Int
  let inputRange: [CGFloat]
  let outputRange: [CGFloat]

  init(inputRange: [CGFloat], outputRange: [CGFloat]) {
    self.length = inputRange.count - 1
    self.inputRange = inputRange
    self.outputRange = outputRange
  }

  func calculate(for x: CGFloat) -> CGFloat {
    if x < inputRange[0] { return outputRange[0] }

    for index in 1...length {
      let x1 = inputRange[index - 1]
      let y1 = inputRange[index]

      let x2 = outputRange[index - 1]
      let y2 = outputRange[index]

      // y = y1 + ((y2 - 21) / (x2 - x1)) * (x - x1)
      if x < inputRange[index] {
        let y = y1 + ((y2 - y1) / (x2 - x1)) * (x - x1)
        return y
      }
    }

    return outputRange[length]
  }
}
