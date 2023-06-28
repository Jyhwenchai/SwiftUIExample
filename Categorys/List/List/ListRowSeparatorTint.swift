//
//  ListRowSeparatorTint.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListRowSeparatorTint: View {
  var body: some View {
    List {
      ForEach(0..<20, id: \.self) { index in
        Text("Row: \(index)")
          .listRowSeparatorTint(.accentColor)
      }
    }
  }
}

#Preview {
  ListRowSeparatorTint()
}
