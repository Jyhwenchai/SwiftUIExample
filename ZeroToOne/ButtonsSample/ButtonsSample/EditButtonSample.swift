//
//  EditButtonSample.swift
//  ButtonsSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

struct EditButtonSample: View {
  @State private var fruits = [
    "Apple",
    "Banana",
    "Papaya",
    "Mango"
  ]

  var body: some View {
    NavigationView {
      List {
        ForEach(fruits, id: \.self) { fruit in
          Text(fruit)
        }
        .onDelete { fruits.remove(atOffsets: $0) }
        .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
      }
      .navigationTitle("Fruits")
      .toolbar {
        EditButton()
      }
    }
  }
}

#Preview {
  EditButtonSample()
}
