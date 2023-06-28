//
//  ModifierOverlay.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

struct ModifierOverlay: View {
  @State private var overlayStyle: CustomOverlay.Style = .empty

  var body: some View {
    VStack {
      Picker("", selection: $overlayStyle) {
        ForEach(CustomOverlay.Style.allCases) { item in
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
          .customOverlay(style: overlayStyle)
      }
    }
  }
}

struct CustomOverlay: ViewModifier {

  enum Style: String, Identifiable, CaseIterable {
    case empty
    case shape
    case safeArea
    case alignment
    var id: Self { self }
  }

  var style: Style

  func body(content: Content) -> some View {
    switch style {
    case .empty:
      content
    case .shape:
     content
        .overlay(Color.red, in: RoundedRectangle(cornerRadius: 8), fillStyle: FillStyle(eoFill: true, antialiased: true))
    case .safeArea:
      content
        .overlay(Color.random, ignoresSafeAreaEdges: .all)
    case .alignment:
      content
        .border(Color.black, width: 1)
        .overlay(alignment: .trailing) {
          RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .fill(Color.random)
            .frame(width: 30, height: 20)
        }
    }
  }
}

extension View {
  func customOverlay(style: CustomOverlay.Style) -> some View {
    self
      .modifier(CustomOverlay(style: style))
  }
}
#Preview {
    ModifierOverlay()
}
