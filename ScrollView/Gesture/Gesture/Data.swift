//
//  Data.swift
//  Gesture
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI
let data: [(String, [Feature])] = [
  (
    "Gestures",
    [
      .init("TapGesture", TapGestureView()),
      .init("SpatialTapGesture", SpatialTapGestureView()),
      .init("LongPressGesture", LongPressGestureView()),
      .init("DragGesture", DragGestureView()),
      .init("MagnifyGesture", MagnifyGestureView()),
      .init("RotateGesture", RotateGestureView()),
      .init("GestureMask", GestureMaskView()),
    ]
  ),
  ("Combining gestures",
   [
    .init("SequenceGesture", SequenceGestureView()),
    .init("SimultaneousGesture", SimultaneousGestureView()),
    .init("ExclusiveGesture", ExclusiveGestureView()),
   ]
  ),
  ("Defining custom gestures",
   [
    .init("highPriorityGesture", HighPriorityGestureView()),
    .init("defersSystemGestures", DefersSystemGestures()),
   ]
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
