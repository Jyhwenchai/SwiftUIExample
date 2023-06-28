//
//  ListHeaderProminence.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListHeaderProminence: View {
  var body: some View {
    List {
      Section(header: Text("Header")) {
        Text("Row")
      }
      .headerProminence(.increased)
    }
    .listStyle(.insetGrouped)
  }
}

#Preview {
  ListHeaderProminence()
}
