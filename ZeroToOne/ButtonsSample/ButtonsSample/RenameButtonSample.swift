//
//  RenameButtonSample.swift
//  ButtonsSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

struct RenameButtonSample: View {
  @State private var name = "ilosic"
  @State private var text = ""
  @FocusState private var isFocused: Bool

  var body: some View {
    TextField(text: $name) {
      Text("Prompt")
    }
    .frame(width: .infinity)
    .padding()
    .focused($isFocused)
    .contextMenu {
      RenameButton()
      // ... your own custom actions
    }
    .renameAction { isFocused = true }
  }
}

#Preview {
  RenameButtonSample()
}
