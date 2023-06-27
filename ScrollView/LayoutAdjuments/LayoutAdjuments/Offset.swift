//
//  Offset.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

struct Offset: View {
  var body: some View {
    Text("Offset by passing CGSize()")
      .border(Color.green)
    // 相对于自身位置的便宜
      .offset(CGSize(width: 20, height: 25))
      .border(Color.gray)
  }
}

#Preview {
  Offset()
}
