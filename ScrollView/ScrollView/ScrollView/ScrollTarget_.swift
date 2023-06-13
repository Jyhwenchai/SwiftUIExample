//
//  ScrollTarget.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// TODO: 待补充效果
struct ScrollTarget_: View {
  private struct Item: Identifiable {
    var id: String { text }
    let text: String
    let color: Color
  }

  @State private var items: [Item] = (0...30).map { Item(text: "item\($0)", color: Color.random) }
  @State private var scrolledID: Item.ID?

  var body: some View {
    VStack {
      Button("Random scrolledID: \(scrolledID ?? "unset")") {
        // 可以应用动画
        withAnimation(.linear) {
          scrolledID = items.randomElement()?.id
        }
      }

      ScrollView {
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
          .fill(Color.blue.gradient)
          .frame(width: 100, height: 100)
          .overlay {
            Text("Top")
          }
          .scrollTarget(isEnabled: false)
        LazyVStack {
          ForEach(items) { item in
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
              .fill(Color.orange)
              .frame(width: 100, height: 100)
              .overlay {
                Text(item.text)
              }
          }
        }
        .scrollTargetLayout()

        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
          .fill(Color.blue.gradient)
          .frame(width: 100, height: 100)
          .overlay {
            Text("Bottom")
          }
      }
      .scrollPosition(id: $scrolledID)
    }
  }
}

#Preview {
    ScrollTarget_()
}
