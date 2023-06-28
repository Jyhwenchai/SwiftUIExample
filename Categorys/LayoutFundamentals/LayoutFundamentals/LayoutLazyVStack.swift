//
//  LayoutLazyVStack.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

struct LayoutLazyVStack: View {
  var body: some View {
    TabView {
      ScrollView(.vertical) {
        LazyVStack(alignment: .center, spacing: 10) {
          ForEach(1...100, id: \.self) { index in
            ZStack {
              RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.orange.gradient)
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
              Text("Column \(index)")
            }
          }
        }
      }
      .tabItem { Text("List") }


      ScrollView(.vertical) {
        LazyVStack(alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders, .sectionFooters]) {
          Section {
            ForEach(1...10, id: \.self) { index in
              ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                  .fill(Color.orange.gradient)
                  .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text("Column \(index)")
              }
            }
          } header: {
            Text("Header")
          } footer: {
            Text("Footer")
          }
        }
      }
      .tabItem { Text("PinnedView") }
    }
  }
}

#Preview {
  LayoutLazyVStack()
}
