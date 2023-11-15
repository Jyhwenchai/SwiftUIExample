//
//  Home.swift
//  TagTextField
//
//  Created by 蔡志文 on 11/15/23.
//

import SwiftUI

struct Home: View {
  @State private var tags: [Tag] = []
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        VStack {
            TagField(tags: $tags)
        }
        .padding()
      }
      .navigationTitle("Tag Field")
    }
  }
}

#Preview {
  Home()
}
