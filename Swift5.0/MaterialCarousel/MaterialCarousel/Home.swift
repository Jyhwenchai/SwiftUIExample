//
//  HOme.swift
//  MaterialCarousel
//
//  Created by 蔡志文 on 7/14/23.
//

import SwiftUI

struct Home: View {
  @State var cards: [Card] = [
    .init(image: "profile1"),
    .init(image: "profile2"),
    .init(image: "profile3"),
    .init(image: "profile4"),
    .init(image: "profile5"),
    .init(image: "profile6"),
    .init(image: "profile7"),
    .init(image: "profile8"),
  ]

  var body: some View {
    VStack {
      GeometryReader { proxy in
        ScrollView(.horizontal) {
          HStack(spacing: 10) {
            ForEach(cards) { card in
              CardView(card)
            }
          }
          .padding(.trailing, proxy.size.width - 180)
        }
        .scrollIndicators(.hidden)
        .clipShape(.rect(cornerRadius: 25))
      }
      .frame(height: 210)
      .padding(.horizontal, 15)
      .padding(.top, 30)
      Spacer()
    }
  }

  @ViewBuilder
  func CardView(_ card: Card) -> some View {
    GeometryReader(content: { geometry in
      let size = geometry.size
      // 当前视图相对于 scrollView 的位置
      let minX = geometry.frame(in: .scrollView).minX
      // 最多裁切 130 width
      let reducingWidth = (minX / 190) * 130
      let cappedWidth = min(reducingWidth, 130)

      let frameWidth = size.width - (minX > 0 ? cappedWidth : -cappedWidth)
      Image(card.image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: size.width, height: size.height)
        .frame(width: frameWidth)
        .clipShape(.rect(cornerRadius: 25))
      // 偏移裁切的值
        .offset(x: minX > 0 ? 0 : -cappedWidth)
        .offset(x: -card.previousOffset)
    })
    .frame(width: 180, height: 200)
    .offsetX { offset in
      let reducingWidth = (offset / 190) * 130
      let index = cards.indexOf(card: card)
      if cards.indices.contains(index + 1) {
        // 前面的视图相对于 scrollView 的偏差
        cards[index + 1].previousOffset = offset < 0 ? 0 : reducingWidth
      }
    }
  }
}

#Preview {
  ContentView()
}
