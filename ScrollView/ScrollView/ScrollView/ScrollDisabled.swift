//
//  ScrollDisabled_.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

struct ScrollDisabled: View {
  var body: some View {
    ScrollView {
      VStack {
        ForEach(0..<40, id: \.self) { index in
          Text("item: \(index)")
        }
      }
    }
    .scrollDisabled(true) // 禁止滚动
  }
}

#Preview {
  ScrollDisabled()
}
