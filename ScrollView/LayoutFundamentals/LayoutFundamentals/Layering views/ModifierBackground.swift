//
//  ModifierBackground.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

struct ModifierBackground: View {
  @State private var backgroundStyle: CustomBackground.Style = .empty
  var body: some View {
    VStack {
      Picker("", selection: $backgroundStyle) {
        ForEach(CustomBackground.Style.allCases) { item in
          Text(item.rawValue).tag(item)
        }
      }
      .pickerStyle(.segmented)
      ZStack {
        Color.clear
          .background {
            Color.orange
          }
        Label("Flag", systemImage: "flag.fill")
          .padding()
          .customBackground(style: backgroundStyle)
      }
    }
  }
}

struct CustomBackground: ViewModifier {

  enum Style: String, Identifiable, CaseIterable {
    case empty
    case shape
    case safeArea
    case alignment
    var id: Self { self }
  }

  let style: Style

  func body(content: Content) -> some View {
    switch style {
    case .empty:
      content
        .background()
    case .shape:
     content
        .background(in: RoundedRectangle(cornerRadius: 8), fillStyle: FillStyle(eoFill: true, antialiased: true))
    case .safeArea:
      content.ignoresSafeArea()
    case .alignment:
      content
        .background(alignment: .trailing) {
          RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .fill(Color.random)
            .frame(width: 30, height: 20)
        }
    }
  }
}

extension View {
  func customBackground(style: CustomBackground.Style) -> some View {
    self
      .modifier(CustomBackground(style: style))
  }
}

#Preview {
  NavigationStack {
    ModifierBackground()
  }
}
