//
//  FixedSize.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

struct FixedSize: View {
  var body: some View {
    Text("A single line of text, too long to fit in a box.")
      .fixedSize()
      .frame(width: 200, height: 200)
      .border(Color.gray)
  }
}

#Preview {
  FixedSize()
}
