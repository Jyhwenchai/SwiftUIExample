//
//  LayoutGridBasic.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

struct LayoutGridBasic: View {
  var body: some View {
    Grid(alignment: .center, horizontalSpacing: 10, verticalSpacing: 10) {
      ForEach(0..<5, id: \.self) { index in
        let randomColor = Color.random
        GridRow(alignment: .center) {
          ForEach(0..<5, id: \.self) { index in
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
              .fill(randomColor)
              .brightness(Double(index) / 10.0)
              .frame(width: 60, height: 60)
          }
        }
      }
    }
  }
}

#Preview {
  LayoutGridBasic()
}
