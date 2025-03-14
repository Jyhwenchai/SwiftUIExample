//
//  ContentView.swift
//  ShapeSample
//
//  Created by 蔡志文 on 1/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Form {
        Section("Rectangle") {
          Rectangle()
            .frame(width: 100, height: 44)
            .foregroundStyle(Color.blue)
        }
        .textCase(.none)

        Section("RoundedRectangle") {
          RoundedRectangle(cornerSize: .init(width: 20, height: 20))
            .frame(width: 100, height: 50)
            .foregroundStyle(Color.blue)
        }
        .textCase(.none)

        Section("UnevenRoundedRectangle") {
          UnevenRoundedRectangle(
            cornerRadii: .init(
              topLeading: 10,
              bottomLeading: 0,
              bottomTrailing: 10,
              topTrailing: 0
            )
          )
          .frame(width: 100, height: 50)
          .foregroundStyle(Color.blue)
        }
        .textCase(.none)

        Section("Circle") {
          Circle()
            .frame(width: 50, height: 50)
            .foregroundStyle(Color.blue)
        }
        .textCase(.none)

        Section("Ellipse") {
          Ellipse()
            .frame(width: 100, height: 50)
            .foregroundStyle(Color.blue)
        }
        .textCase(.none)

        Section("Capsule") {
          Capsule(style: .circular)
            .frame(width: 100, height: 50)
            .foregroundStyle(Color.blue)
        }
        .textCase(.none)

        Section("Path") {
          Path { path in
            path.move(to: .init(x: 10, y: 10))
            path.addLine(to: .init(x: 100, y: 10))
            path.addLine(to: .init(x: 100, y: 50))
            path.addLine(to: .init(x: 10, y: 50))
            path.addLine(to: .init(x: 10, y: 10))
            path.closeSubpath()
          }
          .fill(Color.orange)
//          .stroke(Color.red, style: StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .bevel, miterLimit: 1, dash: [], dashPhase: 1))
//          .stroke(<#_#>, lineWidth: 2)
          .stroke(Color.red, lineWidth: 4, antialiased: true)
          .frame(width: 300, height: 100)
        }
        .textCase(.none)
      }
    }
}

#Preview {
    ContentView()
}
