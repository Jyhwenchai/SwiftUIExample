//
//  ListItemTint.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListItemTint_: View {
  var body: some View {
    List {
      ForEach(0..<20, id: \.self) { index in
        HStack {
          Label(
            title: { Text("Row:: \(index)") },
            icon: { Image(systemName: "\(index).circle") }
          )
        }
        // 两种方式
        .listItemTint(.purple)
        .listItemTint(ListItemTint.monochrome)
      }
    }
  }
}

#Preview {
    ListItemTint_()
}
