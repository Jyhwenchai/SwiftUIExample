//
//  Home.swift
//  CustomYTHeader
//
//  Created by 蔡志文 on 6/21/24.
//

import SwiftUI

struct Home: View {
  @State private var naturalScrollOffset: CGFloat = 0
  @State private var lastNaturalOffset: CGFloat = 0
  @State private var headerOffset: CGFloat = 0
  @State private var isScrollingUp: Bool = false

  var body: some View {
    GeometryReader {
      let safeArea = $0.safeAreaInsets
      let headerHeight = 60 + safeArea.top

      ScrollView(.vertical) {
        LazyVStack(spacing: 15) {
          ForEach(1...50, id: \.self) { _ in
            DummyView()
          }
        }
        .padding(15)
      }
      .safeAreaInset(edge: .top, spacing: 0, content: {
        HeaderView()
          .padding(.bottom, 15)
          .frame(height: headerHeight, alignment: .bottom)
          .background(.background)
          .offset(y: -headerOffset)
      })
      .onScrollGeometryChange(for: CGFloat.self) { proxy in
        let maxHeight = proxy.contentSize.height - proxy.containerSize.height
        print("contentSize: \(proxy.contentSize), containerSize: \(proxy.containerSize)")
        return max(min(proxy.contentOffset.y + headerHeight, maxHeight), 0)
      } action: { oldValue, newValue in
        let isScrollingUp = oldValue < newValue
        headerOffset = min(max(newValue - lastNaturalOffset, 0), headerHeight)
        self.isScrollingUp = isScrollingUp

        naturalScrollOffset = newValue
      }
      .onScrollPhaseChange({ oldPhase, newPhase, context in
        if !newPhase.isScrolling && (headerOffset != 0 || headerOffset != headerHeight) {

          withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
            if headerOffset > (headerHeight * 0.5) && naturalScrollOffset > headerOffset {
              headerOffset = headerHeight
            } else {
              headerOffset = 0
            }
            lastNaturalOffset = naturalScrollOffset - headerOffset
          }
        }
      })
      .onChange(of: isScrollingUp, { oldValue, newValue in
        lastNaturalOffset = naturalScrollOffset - headerOffset
      })
      .ignoresSafeArea(.container, edges: .top)

    }
  }

  @ViewBuilder
  func HeaderView() -> some View {
    HStack(spacing: 20) {
      Image("Logo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 40)

      Spacer(minLength: 0)

      Button("", systemImage: "airplayvideo") {

      }

      Button("", systemImage: "bell") {

      }

      Button("", systemImage: "magnifyingglass") {

      }
    }
    .padding(.horizontal, 15)
    .tint(Color.white)
  }

  @ViewBuilder
  func DummyView() -> some View {
    VStack(alignment: .leading, spacing: 6) {
      RoundedRectangle(cornerRadius: 6)
        .frame(height: 220)

      HStack(spacing: 10) {
        Circle()
          .frame(width: 45, height: 45)

        VStack(alignment: .leading, spacing: 4) {
          Rectangle()
            .frame(height: 10)

          HStack(spacing: 10) {
            Rectangle()
              .frame(width: 100)
            Rectangle()
              .frame(width: 80)
            Rectangle()
              .frame(width: 60)
          }
          .frame(height: 10)
        }
      }
    }
    .foregroundStyle(.tertiary)
  }
}

#Preview {
  Home()
    .preferredColorScheme(.dark)
}
