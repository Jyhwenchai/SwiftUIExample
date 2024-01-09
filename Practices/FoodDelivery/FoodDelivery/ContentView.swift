//
//  ContentView.swift
//  FoodDelivery
//
//  Created by 蔡志文 on 1/3/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    List {
        Section(header: Text("Header")) {
            Group {
                Text("Item 1")
                Text("Item 2")
            }
            .background(Color.yellow)
        }
    }
  }
}

#Preview {
    ContentView()
}
