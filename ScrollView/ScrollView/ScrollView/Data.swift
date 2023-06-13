//
//  Data.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

struct Item: Identifiable {
  var id = UUID()
  var text: String
}

let list: [(String, [Feature])] = [
  ("Properties",
   [
    .init("Axis", ScrollAxis())
   ]
  ),
  ("Showing scroll indicators",
   [
    .init("ScrollIndicators", ScrollIndicators()),
    .init("ScrollIndicatorsFlash", ScrollIndicatorsFlash()),
   ]
  ),
  ("Managing content visibility",
   [
    .init("ScrollContentBackground", ScrollContentBackground()),
    .init("ScrollClipDisabled", ScrollClipDisabled()),
   ]
  ),
  ("Disabling scrolling",
   [.init("ScrollDisabled", ScrollDisabled())]
  ),
  ("configuring scroll bounce behavior",
   [.init("ScrollBounceBehavior", ScrollBounceBehavior())]
  ),
  ("interacting with a software keyboard",
   [.init("ScrollDismissesKeyboard", ScrollDismissesKeyboard())]
  ),
  ("Manageing scroll position",
   [.init("ScrollPosition", ScrollPosition())]
  ),
  ("Defining scroll targets",
   [
    .init("ScrollTarget", ScrollTarget_()),
    .init("ScrollTargetBehavior", ScrollTargetBehavior_())
   ]
  ),
  ("Animating scroll transitions",
   [.init("ScrollTransition", ScrollTransition())]
  )
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

