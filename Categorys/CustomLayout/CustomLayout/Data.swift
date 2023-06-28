//
//  Data.swift
//  CustomLayout
//
//  Created by 蔡志文 on 6/21/23.
//

import SwiftUI
let data: [(String, [Feature])] = [

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
