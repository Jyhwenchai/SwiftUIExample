//
//  ContentView.swift
//  ParallaxCarousel
//
//  Created by 蔡志文 on 8/25/23.
//

import SwiftUI

struct ContentView: View {
  @State private var searchText: String = ""
  var body: some View {
    ScrollView(.vertical) {
      VStack(spacing: 15) {
        HStack(spacing: 12) {
          Button(action: {}, label: {
            Image(systemName: "line.3.horizontal")
              .font(.title)
              .foregroundStyle(.blue)
          })

          HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
              .foregroundStyle(.gray)
            TextField("Search", text: $searchText)
          }
          .padding(.horizontal, 15)
          .padding(.vertical, 10)
          .background(.ultraThickMaterial, in: .capsule)
        }

        Text("Where do you want to \n travel?")
          .font(.largeTitle.bold())
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.top, 10)

        GeometryReader { geometry in
          let size = geometry.size

          ScrollView(.horizontal) {
            HStack(spacing: 10) {
              ForEach(tripCards) { card in
                GeometryReader { proxy in
                  let cardSize = proxy.size

                  // style1
                  let minX = proxy.frame(in: .scrollView).minX

                  // style2
//                  let minX = min(proxy.frame(in: .scrollView).minX * 1.4, proxy.size.width * 1.4)

                  Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                  // simply use scaling
//                    .scaleEffect(1.25)
                  // animate
                    .offset(x: -minX)
                  // style2
//                    .frame(width: proxy.size.width * 2.5)
                    .frame(width: cardSize.width, height: cardSize.height)
                    .overlay(content: {
                      OverlayView(card)
                    })
                    .clipShape(.rect(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                }
                .frame(width: size.width - 60, height: size.height - 50)
                /// Scroll Animation
                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                  view
                    .scaleEffect(phase.isIdentity ? 1 : 0.95)
                }
              }
            }
            .padding(.horizontal, 30)
            .scrollTargetLayout()
            .frame(height: size.height, alignment: .top)
          }
          .scrollTargetBehavior(.viewAligned)
          .scrollIndicators(.hidden)
        }
        .frame(height: 500)
        .padding(.horizontal, -15)
        .padding(.top, 10)
      }
      .padding(15)
    }
    .scrollIndicators(.hidden)
  }


  @ViewBuilder
  func OverlayView(_ card: TripCard) -> some View {
    ZStack(alignment: .bottomLeading, content: {
      LinearGradient(colors: [
        .clear,
        .clear,
        .clear,
        .clear,
        .clear,
        .black.opacity(0.1),
        .black.opacity(0.5),
        .black
      ], startPoint: .top, endPoint: .bottom)

      VStack(alignment: .leading, spacing: 4, content: {
        Text(card.title)
          .font(.title2)
          .fontWeight(.black)
          .foregroundStyle(.white)

        Text(card.subTitle)
          .font(.callout)
          .foregroundStyle(.white.opacity(0.8))
      })
      .padding(20)
    })
  }
}

#Preview {
  ContentView()
}
