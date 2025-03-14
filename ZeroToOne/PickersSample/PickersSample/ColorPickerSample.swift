//
//  ColorPickerSample.swift
//  PickersSample
//
//  Created by 蔡志文 on 1/17/25.
//

import SwiftUI

struct ColorPickerSample: View {
  @State private var bgColor =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

  var body: some View {
    VStack {
      ColorPicker("Alignment Guides", selection: $bgColor)
    }
  }
}

#Preview {
  ColorPickerSample()
}
