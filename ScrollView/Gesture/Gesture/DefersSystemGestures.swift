//
//  DefersSystemGestures.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI

/// 设置您希望手势优先于系统手势的屏幕边缘
struct DefersSystemGestures: View {
  var body: some View {
    Canvas { context, size in
      print(context, size)
    }
    .defersSystemGestures(on: .vertical)
  }
}

#Preview {
    DefersSystemGestures()
}
