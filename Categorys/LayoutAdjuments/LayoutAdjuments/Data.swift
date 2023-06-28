//
//  Data.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

let data: [(String, [Feature])] = [
  ("Adding padding around a view",
   [
    .init("Padding", Padding()),
    .init("ScenePadding", ScenePadding())
   ]
  ),
  ("Influencing aview's size",
   [
    .init("frame", Frame()),
    .init("ContainerRelativeFrame", ContainerRelativeFrame()),
    .init("FixedSize", FixedSize()),
    .init("LayoutPriority", LayoutPriority())
   ]
  ),
  ("Adjusting a view's position",
   [
    .init("Position", Position()),
    .init("Offset", Offset())
   ]
  ),
  ("Setting margins",
   [
    .init("ContentMargins", ContentMargins())
   ]
  ),
 ("Staying in the safe areas",
  [
    .init("IgnoresSafeArea", IgnoresSafeArea()),
    .init("SafeAreaInset", SafeAreaInset_()),
    .init("SafeAreaPadding", SafeAreaPadding_()),
  ]
 ),
  ("Setting a llayout direction",
   [
    .init("LayoutDirectionBehavior", LayoutDirectionBehavior_())
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

