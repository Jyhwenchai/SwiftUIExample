//
//  ListRowInsets.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListRowInsets: View {
  var body: some View {
    List {
      ForEach(0..<20, id: \.self) { index in
        HStack {
          Text("Row: \(index)")
          Spacer()
          Text("Trailing")
        }
        // bottom 会覆盖 top
        .listRowInsets(EdgeInsets(top: 20, leading: 30, bottom: 40, trailing: 30))
      }
    }
  }
}

#Preview {
  ListRowInsets()
}
