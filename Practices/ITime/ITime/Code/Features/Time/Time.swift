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
  @State private var indicatorPositon: CGPoint = CGPoint(x: 0, y: 20)
  @State private var navigationPath: NavigationPath = NavigationPath()
  @State private var animateEnabled = false
  @State private var isPopover = false
  @State private var isPickerTimeLineType = false
  @State private var isPickerTimeHistoryType = false

  @State private var timeLineStyle: TimeLineStyle = .circle

  var body: some View {
    NavigationStack(path: $navigationPath) {
      GeometryReader { proxy in
        VStack {
          VStack {
            ZStack {
              Rectangle()
                .fill(Color("medium_blue"))
              VStack {
                Spacer()
                HStack {
                  TabsView()
                    .offset(y: -8)
                  if currentTab.page == .timeline {
                    Button {
                      isPickerTimeLineType.toggle()
                    } label: {
                      Text("列表")
                        .font(.system(size: 13))
                        .foregroundColor(Color.white)
                      Image("xiala8x8")
                    }
                    .iOSPopover(isPresented: $isPickerTimeLineType, arrowDirection: .up, backgroundColor: .black) {
                      VStack(alignment: .leading, spacing: 0) {
                        ForEach(TimeLineStyle.allCases, id: \.self) { style in
                          Button(style.description) {
                            isPickerTimeLineType.toggle()
                            timeLineStyle = style
                          }
                          .padding(.vertical, 12)
                          .padding(.horizontal, 16)
                          .font(.callout)
                          .foregroundColor(.white)
                        }
                      }
                    }
                  } else if currentTab.page == .statistics {
                    Button {
                      isPickerTimeHistoryType.toggle()
                    } label: {
                      Text("按年")
                        .font(.system(size: 13))
                        .foregroundColor(Color.white)
                      Image("xiala8x8")
                    }
                    .iOSPopover(isPresented: $isPickerTimeHistoryType, arrowDirection: .up, backgroundColor: .black) {
                      let types = ["按年", "按月", "按周"]
                      VStack(alignment: .leading, spacing: 0) {
                        ForEach(types, id: \.self) { type in
                          Button(type) {
                            isPickerTimeHistoryType.toggle()
                          }
                          .padding(.vertical, 12)
                          .padding(.horizontal, 16)
                          .font(.callout)
                          .foregroundColor(.white)
                        }
                      }
                    }
                  }

                  Button {
                    isPopover = true
                  } label: {
                    Image("ic_more22x22")
                      .padding(.trailing, 8)
                  }
                  .iOSPopover(isPresented: $isPopover, arrowDirection: .up) {
                    VStack(alignment: .leading, spacing: 0) {
                      ForEach(TimeMenu.allCases) { menu in
                        Button(menu.rawValue) {
                          isPopover.toggle()
                        }
                        .padding(.vertical, 12)
                        .padding(.leading, 16)
                        .padding(.trailing, 50)
                        .font(.callout)
                        .foregroundColor(.black)
                      }
                    }
                    .foregroundColor(.white)
                  }
                }
              }
            }
          }
          .frame(height: proxy.safeAreaInsets.top + 44)
          TabView(selection: $currentTab) {
            ForEach(tabs) { tab in

              GeometryReader { proxy in
                let size = proxy.size
                switch tab.page {
                case .overview:
                  Overview(navigationPath: $navigationPath)
                    .foregroundColor(Color.white)
                    .frame(width: size.width, height: size.height)
                case .timeline:
                  TimeLine(timeLineStyle: $timeLineStyle)
                    .foregroundColor(Color.white)
                    .frame(width: size.width, height: size.height)
                case .statistics:
                  Statistics()
                    .foregroundColor(Color.white)
                    .frame(width: size.width, height: size.height)
                }
              }
              .offsetX { rect in
                if currentTab.title == tab.title {
                  contentOffset = rect.minX - (rect.width * CGFloat(index(of: tab)))
                }
              }
              .tag(tab)
            }
          }
          .tabViewStyle(.page(indexDisplayMode: .never))
          .toolbarBackground(.hidden, for: .navigationBar)
          .onChange(of: currentTab) { newValue in
            indicatorWidth = newValue.width + 10
            indicatorPositon = CGPoint(x: newValue.positionX + 2, y: 20 * 35 / currentTab.width)
            contentOffset = proxy.size.width * CGFloat(index(of: newValue))
            animateEnabled = true
          }
        }
        .ignoresSafeArea()

      }
    }
  }

  func index(of tab: TimeTab) -> Int {
    tabs.firstIndex(of: tab) ?? 0
  }

  /// Tabs View
  @ViewBuilder
  func TabsView() -> some View {
    HStack(spacing: 20) {
      ForEach($tabs) { $tab in
        Button {
          currentTab = tab
        } label: {
          Text(tab.title)
            .fontWeight(.semibold)
            .background(GeometryReader { geometry in
              Color.clear
                .preference(key: TabItemWidthPreferenceKey.self, value: geometry.size.width)
                .onPreferenceChange(TabItemWidthPreferenceKey.self) { width in
                  tab.width = width
                  let position = geometry.frame(in: .global).origin.x + tab.width / 2
                  tab.positionX = position
                  if currentTab.id == tab.id {
                    currentTab.width = width
                    currentTab.positionX = position
                    indicatorPositon = CGPoint(x: currentTab.positionX, y: 20 * 35 / currentTab.width)
                  }
                }
            })
        }
      }
      Spacer()
    }
    .padding([.top, .horizontal], 15)
    .overlay(alignment: .bottomLeading) {
      Image("ic_indicatior72x72")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: indicatorWidth)
        .position(x: indicatorPositon.x, y: indicatorPositon.y)
        .animation(.linear(duration: animateEnabled ? 0.2 : 0), value: indicatorPositon)
        .animation(.linear(duration: 0.2), value: indicatorWidth)
    }
    .foregroundColor(Color.white)
  }

}

struct Time_Previews: PreviewProvider {
  static var previews: some View {
    Time()
  }
}
