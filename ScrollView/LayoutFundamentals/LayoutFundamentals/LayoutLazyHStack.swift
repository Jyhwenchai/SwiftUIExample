//
//  LayoutLazyHStack.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

/// `Lazy` 意味着 Stack 中的视图不会立即创建，直到视图出现在屏幕中才会创建。
struct LayoutLazyHStack: View {
  var body: some View {
    TabView {
      ScrollView(.horizontal) {
        LazyHStack(alignment: .center, spacing: 10) {
          ForEach(1...100, id: \.self) { index in
            ZStack {
              RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(Color.orange.gradient)
                .frame(width: 100, height: 100)
              Text("Column \(index)")
            }
          }
        }
      }
      .tabItem { Text("List") }


      ScrollView(.horizontal) {
        LazyHStack(alignment: .center, spacing: 10, pinnedViews: [.sectionHeaders, .sectionFooters]) {
          Section {
            ForEach(1...10, id: \.self) { index in
              ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                  .fill(Color.orange.gradient)
                  .frame(width: 100, height: 100)
                Text("Column \(index)")
              }
            }
          } header: {
            Text("Header")
              .rotation3DEffect(
                .degrees(-90),
                axis: (x: 0.0, y: 0, z: 1.0),
                anchor: .center,
                anchorZ: 0.0,
                perspective: 1.0
              )
          } footer: {
            Text("Footer")
              .rotation3DEffect(
                .degrees(90),
                axis: (x: 0.0, y: 0, z: 1.0),
                anchor: .center,
                anchorZ: 0.0,
                perspective: 1.0
              )
          }
        }
      }
      .tabItem { Text("PinnedView") }
    }
  }
}

#Preview {
  LayoutLazyHStack()
}
