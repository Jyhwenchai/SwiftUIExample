//
//  ScenePadding.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/19/23.
//

import SwiftUI

struct ScenePadding: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("Scene padding")
        .scenePadding(.horizontal)
        .border(.red) // Border added for reference.
      Text("Regular padding")
        .padding(.horizontal)
        .border(.green)
      Text("Text with no padding")
        .border(.blue)
      Button("Button") { }
    }
  }
}

#Preview {
  ScenePadding()
}
