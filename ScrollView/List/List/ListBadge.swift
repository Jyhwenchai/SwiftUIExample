//
//  ListBadge.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListBadge: View {
    var body: some View {
      List {
        ForEach(0..<10, id: \.self) { index in
          Text("Row:\(index)")
//            .badge(Int.random(in: 1..<20))
//            .badge(Text(String("ABCDEFG".randomElement() ?? Character(""))))
            .badge(String("ABCDEFG".randomElement() ?? Character("")))
        }
      }
      .badgeProminence(.increased)
    }
}

#Preview {
    ListBadge()
}
