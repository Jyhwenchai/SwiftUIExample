//
//  ListSection.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListSection: View {
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
      }
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
    ListSection()
}
