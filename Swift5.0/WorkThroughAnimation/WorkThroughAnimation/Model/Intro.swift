//
//  Intro.swift
//  WorkThroughAnimation
//
//  Created by 蔡志文 on 7/7/23.
//

import SwiftUI

struct Intro: Identifiable {
  let id = UUID()
  var text: String
  var textColor: Color
  var circleColor: Color
  var bgColor: Color
  var circleOffset: CGFloat = 0
  var textOffset: CGFloat = 0
}

let sampleIntros: [Intro] = [
  .init(text: "Let's Create", textColor: .color0, circleColor: .color0, bgColor: .color1),
  .init(text: "Let's Brain Storm", textColor: .color1, circleColor: .color1, bgColor: .color2),
  .init(text: "Let's Emplore", textColor: .color2, circleColor: .color2, bgColor: .color3),
  .init(text: "Let's Invent", textColor: .color3, circleColor: .color3, bgColor: .color0),
  .init(text: "Let's Create", textColor: .color0, circleColor: .color0, bgColor: .color1),
]
