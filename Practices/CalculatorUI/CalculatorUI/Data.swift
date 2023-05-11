//
//  Data.swift
//  CalculatorUI
//
//  Created by 蔡志文 on 5/9/23.
//

import SwiftUI

struct NumberItem: Identifiable {
  var id = UUID()
  let text: String
  let textColor: Color
  let backgroundColor: Color
  let column: Int

  init(text: String, textColor: Color = .white, backgroundColor: Color, column: Int) {
    self.text = text
    self.textColor = textColor
    self.backgroundColor = backgroundColor
    self.column = column
  }
}

struct CalculatorRow: Identifiable {
  var id = UUID()
  var items: [NumberItem]
}

class CalculatorData {
  static var rows: [CalculatorRow] = [
    CalculatorRow(items: [
      NumberItem(text: "C", textColor: Color.black, backgroundColor: Color.customGray, column: 1),
      NumberItem(text: "+/-", textColor: Color.black, backgroundColor: Color.customGray, column: 1),
      NumberItem(text: "%", textColor: Color.black, backgroundColor: Color.customGray, column: 1),
      NumberItem(text: "÷", backgroundColor: Color.customOrange, column: 1),
    ]),
    CalculatorRow(items: [
      NumberItem(text: "7", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "8", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "9", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "×", backgroundColor: Color.customOrange, column: 1),
    ]),
    CalculatorRow(items: [
      NumberItem(text: "4", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "5", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "6", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "-", backgroundColor: Color.customOrange, column: 1),
    ]),
    CalculatorRow(items: [
      NumberItem(text: "1", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "2", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "3", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "+", backgroundColor: Color.customOrange, column: 1),
    ]),
    CalculatorRow(items: [
      NumberItem(text: "0", backgroundColor: Color.customDark, column: 2),
      NumberItem(text: ".", backgroundColor: Color.customDark, column: 1),
      NumberItem(text: "=", backgroundColor: Color.customOrange, column: 1),
    ])
  ]
}

extension Color {
  static var customGray = Color(red: 164/255.0, green: 164/255.0, blue: 164/255.0)
  static var customOrange = Color(red: 230/255.0, green: 147/255.0, blue: 34/255.0)
  static var customDark = Color(red: 54/255.0, green: 54/255.0, blue: 54/255.0)
}
