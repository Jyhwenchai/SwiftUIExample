//
//  ListBadgeProminence.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListBadgeProminence: View {
  var body: some View {
    List {
      ForEach(0..<10, id: \.self) { index in
        Text("Row:\(index)")
          .badge(String("ABCDEFG".randomElement() ?? Character("")))
      }
    }
    .badgeProminence(.increased)
  }
}

#Preview {
  ListBadgeProminence()
}
