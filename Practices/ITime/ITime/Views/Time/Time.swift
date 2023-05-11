//
//  Time.swift
//  ITime
//
//  Created by 蔡志文 on 5/9/23.
//

import SwiftUI

struct Time: View {
  @State private var currentTab: TimeTab = TimeData.tabs[0]
  @State private var tabs = TimeData.tabs
  @State private var contentOffset: CGFloat = 0
  @State private var indicatorWidth: CGFloat = 0
  @State private var indicatorPositon: CGFloat = 0

  var body: some View {
    NavigationStack {
      TabView(selection: $currentTab) {
        ForEach(tabs) { tab in
          GeometryReader { proxy in
            let size = proxy.size
            Overview()
              .foregroundColor(Color.white)
              .frame(width: size.width, height: size.height)
          }
//          .clipped()
//          .ignoresSafeArea()
//          .background(Color.red)
          .offsetX { rect in
            if currentTab.title == tab.title {
              contentOffset = rect.minX - (rect.width * CGFloat(index(of: tab)))
            }

            updateTabFrame(rect.width)
          }
          .tag(tab)
        }
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
//      .ignoresSafeArea()
//      .background(ignoresSafeAreaEdges: .all)

      .toolbarBackground(Color("medium_blue"), for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Text("")
        }
      }
    }
    .overlay(alignment: .top) {
      TabsView()
        .offset(y: -5)
    }
  }

  /// calculate Tab width & postion
  func updateTabFrame(_ tabViewWidth: CGFloat) {
    let inputRange = tabs.indices.compactMap { index -> CGFloat? in
      let width = CGFloat(index) * tabViewWidth
      return width
    }

    let outputRangeForWidth = tabs.compactMap { tab -> CGFloat? in
      tab.width
    }

    let outputRangeForPosition = tabs.compactMap { tab -> CGFloat? in
      tab.minX
    }

    let widthInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForWidth)

    let positonInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForPosition)

    indicatorWidth = widthInterpolation.calculate(for: -contentOffset)
    indicatorPositon = positonInterpolation.calculate(for: -contentOffset)
  }

  func index(of tab: TimeTab) -> Int {
    tabs.firstIndex(of: tab) ?? 0
  }

  /// Tabs View
  @ViewBuilder
  func TabsView() -> some View {
    HStack(spacing: 0) {
      ForEach($tabs) { $tab in
        Text(tab.title)
          .fontWeight(.semibold)
          .offsetX { rect in
            tab.minX = rect.minX
            tab.width = rect.width
          }
        if tabs.last != tab {
          Spacer(minLength: 0)
        }
      }
    }
    .padding([.top, .horizontal], 15)
    .overlay(alignment: .bottomLeading) {
      Rectangle()
        .frame(width: indicatorWidth, height: 4)
        .offset(x: indicatorWidth, y: 10)
    }
    .foregroundColor(Color.white)
  }

}

struct Time_Previews: PreviewProvider {
  static var previews: some View {
    Time()
  }
}
