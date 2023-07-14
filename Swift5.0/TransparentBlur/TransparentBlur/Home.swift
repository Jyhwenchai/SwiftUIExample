//
//  Home.swift
//  TransparentBlur
//
//  Created by 蔡志文 on 7/12/23.
//

import SwiftUI

struct Home: View {

  @State private var blurType: BlurType = .freeStyle
  var body: some View {
    GeometryReader { geometry in
      let safeArea = geometry.safeAreaInsets

      ScrollView {
        VStack {
          TransparentBlurView(removeAllFilters: false)
            .blur(radius: 15, opaque: blurType == .cliped)
            .padding([.horizontal, .top], -30)
            .frame(height: 100 + safeArea.top)
            .offset(y: -safeArea.top)
            .visualEffect { view, proxy in
              view
                .offset(y: (proxy.bounds(of: .scrollView)?.minY ?? 0))
            }
            .zIndex(1000)

          VStack(alignment: .leading, spacing: 10, content: {
            GeometryReader {
              let size = $0.size

              Image(.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 25))

            }
            .frame(height: 500)

            Text("Blur Type")
              .font(.caption)
              .foregroundStyle(.gray)
              .padding(.top, 15)

            Picker("", selection: $blurType) {
              ForEach(BlurType.allCases, id: \.self) { type in
                Text(type.rawValue)
                  .tag(type)
              }
            }
            .pickerStyle(.segmented)
          })
          .padding(15)
          .padding(.bottom, 500)
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(.container, edges: .top)
      }
    }
  }
}

#Preview {
  Home()
}

enum BlurType: String, CaseIterable {
  case cliped
  case freeStyle
}
