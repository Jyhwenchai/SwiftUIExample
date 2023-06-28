//
//  Data.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI
let data: [(String, [Feature])] = [
  ("Stack", [
    .init("HStack", LayoutHStack()),
    .init("VStack", LayoutVStack()),
    .init("ZStack", LayoutZStack()),
    .init("LazyHStack", LayoutLazyHStack()),
    .init("LazyVStack", LayoutLazyVStack()),
  ]),
  ("Grid", [
    .init("Grid", LayoutGrid()),
    .init("LazyGrid", LayoutLazyGrid()),
  ]),
  ("Layering views", [
    .init("background", ModifierBackground()),
    .init("overlay", ModifierOverlay())
  ]),
  ("Automatically choosing the layout that fits", [
    .init("ViewThatFits", LayoutViewThatFits()),
  ])
]

struct Feature: Identifiable {
  let title: String
  let view: AnyView
  var id: String { title }
  init(_ title: String, _ view: some View) {
    self.title = title
    self.view = AnyView(view)
  }
}

extension Color {
  static var random: Color { Color(
    red: Double.random(in: 0..<1),
    green: Double.random(in: 0..<1),
    blue: Double.random(in: 0..<1))
  }
}
