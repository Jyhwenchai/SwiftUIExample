//
//  ContentView.swift
//  SwipeToHideNavBar
//
//  Created by 蔡志文 on 9/26/23.
//

import SwiftUI

struct ContentView: View {
  @State private var hideNavBar: Bool = true
  var body: some View {
    NavigationStack {
      List {
        ForEach(0..<40, id: \.self) { index in
          NavigationLink {
            List {
              ForEach(0..<30, id: \.self) { index in
                Text("Sub Item \(index)")
              }
            }
            .navigationTitle("Item \(index)")
            .hideNavBarOnSwipe(false)
          } label: {
            Text("List \(index)")
          }
        }
      }
      .listStyle(.plain)
      .navigationTitle("Chat App")
      .toolbar(content: {
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: {
            hideNavBar.toggle()
          }, label: {
            Image(systemName: hideNavBar ? "eye.slash" : "eye")
          })
        }
      })
      .hideNavBarOnSwipe(hideNavBar)
    }
  }
}

#Preview {
    ContentView()
}
