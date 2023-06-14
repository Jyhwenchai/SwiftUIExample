//
//  ListSectionSeparatorTint.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListSectionSeparatorTint: View {
  var body: some View {
    List {
      ForEach(0..<3, id: \.self) { index in
        Section {
          ForEach(0..<6, id: \.self) { index in
            Text("Row: \(index)")
          }
        } header: {
          Text("Header")
        } footer: {
          Text("Footer")
        }
        .listSectionSeparatorTint(.accentColor) // 在listStyle 为 insetGrouped 下无效
      }
    }
    .listStyle(.inset)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  ListSectionSeparatorTint()
}
