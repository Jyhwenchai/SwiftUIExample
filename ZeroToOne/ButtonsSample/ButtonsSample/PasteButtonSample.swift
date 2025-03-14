//
//  PasteButtonSample.swift
//  ButtonsSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

struct PasteButtonSample: View {
  @State private var pastedText: String = ""

  var body: some View {
    VStack {
      PasteButton(payloadType: String.self) { strings in
        pastedText = strings[0]
      }
      Divider()
      Text(pastedText)
      Spacer()
    }
  }
}

#Preview {
  PasteButtonSample()
}
