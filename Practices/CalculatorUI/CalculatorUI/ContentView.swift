//
//  ContentView.swift
//  CalculatorUI
//
//  Created by 蔡志文 on 5/8/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    GeometryReader { proxy in
      let spacing: Double = 10.0
      let width: Double = (proxy.size.width - 3.0 * spacing) / 4.0
      VStack {
        Spacer()
        Text("0")
          .font(.system(size: 90))
          .frame(maxWidth: .infinity, maxHeight: 100, alignment: .trailing)
          .padding(.horizontal, 20)
        Grid(horizontalSpacing: 10, verticalSpacing: 10) {
          ForEach(CalculatorData.rows) { row in
            GridRow {
              ForEach(row.items) { item in
                Button(action: {
                  print(item.text)
                }) {
                  Text(item.text)
                    .frame(width: width * Double(item.column), height: width)
                }
                .gridCellColumns(item.column)
                .background(item.backgroundColor)
                .foregroundColor(item.textColor)
                .cornerRadius(width / 2)
              }
            }
          }
        }
      }
      .font(.largeTitle)
    }
    .padding(10)
    .foregroundColor(Color.white)
    .background(Color.black)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
