//
//  HOme.swift
//  CircularSlider
//
//  Created by 蔡志文 on 7/18/23.
//

import SwiftUI

struct Home: View {
  @State private var pickerType: TripPicker = .normal
  @State private var activeID: Int?
  var body: some View {
    VStack {
      Picker("", selection: $pickerType) {
        ForEach(TripPicker.allCases, id: \.rawValue) {
          Text($0.rawValue)
            .tag($0)
        }
      }
      .pickerStyle(.segmented)
      
      Spacer()
      
      GeometryReader {
        let size = $0.size
        let padding = (size.width - 70) / 2
        ScrollView(.horizontal) {
          HStack(spacing: 35) {
            ForEach(1...8, id: \.self) { index in
              Image("img\(index)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(.circle)
                .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
              // 提供视图自身的坐标系统，可以应用一些效果
                .visualEffect { view, proxy in
                  view
                    .offset(y: offset(proxy))
                    .offset(y: scale(proxy) * 15)
                }
                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                  view
//                    .offset(y: phase.isIdentity && activeID == index ? 15 : 0)
                    .scaleEffect(phase.isIdentity && activeID == index && pickerType == .scaled ? 1.5 : 1, anchor: .bottom)
                }
            }
          }
          .frame(height: size.height)
          .offset(y: -30)
          .scrollTargetLayout()
        }
        .background {
          if pickerType == .normal {
            Circle()
              .fill(.white.shadow(.drop(color: .black.opacity(0.2), radius: 5)))
              .frame(width: 85, height: 85)
              .offset(y: -15)
          }
        }
        // 压缩了 ScrollView 的安全区域
        .safeAreaPadding(.horizontal, padding)
        .scrollIndicators(.hidden)
        .scrollPosition(id: $activeID)
        .scrollTargetBehavior(.viewAligned)
        .frame(height: size.height)
      }
      .frame(height: 200)
      .ignoresSafeArea(.container, edges: .bottom)
    }
  }


  func offset(_ proxy: GeometryProxy) -> CGFloat {
    let progress = progress(proxy)
    return progress < 0 ? progress * -30 : progress * 30
  }

  func scale(_ proxy: GeometryProxy) -> CGFloat {
    let progress = min(max(progress(proxy), -1), 1)
    return progress < 0 ? 1 + progress : 1 - progress
  }

  func progress(_ proxy: GeometryProxy) -> CGFloat {
    let viewWidth = proxy.size.width
    let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
    return minX / viewWidth
  }
}

#Preview {
  ContentView()
}

enum TripPicker: String, CaseIterable {
  case scaled = "Scaled"
  case normal = "Normal"
}
