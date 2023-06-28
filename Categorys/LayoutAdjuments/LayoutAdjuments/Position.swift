//
//  Position.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

struct Position: View {
    var body: some View {
      Text("Position by passing a CGPoint()")
      // 相对于父视图的位置
          .position(CGPoint(x: 175, y: 100))
          .border(Color.gray)
    }
}

#Preview {
    Position()
}
