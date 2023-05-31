//
//  Statistics.swift
//  ITime
//
//  Created by 蔡志文 on 5/24/23.
//

import SwiftUI

struct StatisticsDemo: View {

  private var slices = PieModel.sample
  var circlePath: Path = Path { p in
    p.move(to: .zero)
    p.addArc(center: .zero, radius: 90, startAngle: .radians(0), endAngle: .radians(Double.pi * 2), clockwise: true)
  }

  init() {
    let radius = UIScreen.main.bounds.width * 0.45
    let total = slices.reduce(0) { $0 + $1.value }
    var startAngle = Angle.zero
    for (index, slice) in slices.enumerated() {
      let angle = Angle(degrees: 360 * (slice.value / total))
      let endAngle = startAngle + angle

      let path = Path { p in
        p.move(to: .zero)
        p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        p.closeSubpath()
      }
      startAngle = endAngle
      self.slices[index].path = path
    }
  }

  var body: some View {
    VStack {
      HStack {
        Button {

        } label: {
          ZStack {
            Capsule()
              .fill(Color.white)
              .clipShape(Rectangle().offset(x: 10))
              .frame(width: 70, height: 30)
              .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            Text("前一天")
              .font(.caption)
              .foregroundColor(Color.black)
              .offset(x: 6)
          }
          .offset(x: -10)
        }
        Spacer()
        Text("今天")
          .foregroundColor(Color.black)
        Spacer()
        Button {

        } label: {
          ZStack {
            Capsule()
              .fill(Color.white)
              .clipShape(Rectangle().offset(x: -10))
              .frame(width: 70, height: 30)
              .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 0)
            Text("后一天")
              .font(.caption)
              .foregroundColor(Color.black)
              .offset(x: -6)
          }
        }
        .offset(x: 10)
      }
      .padding(.top, 10)

      /// Content
      GeometryReader { proxy in
        Canvas { context, size in
          context.translateBy(x: size.width / 2, y: size.height / 2)
          var pieContext = context
          pieContext.rotate(by: .degrees(90))
          pieContext.clip(to: circlePath, options: .inverse)
          for slice in slices {
            if let path = slice.path {
              pieContext.fill(path, with: .color(slice.color))
              pieContext.stroke(path, with: .color(.white), lineWidth: 1)
            }
          }
        }
        .onTapGesture { location in
          let screenSize = UIScreen.main.bounds.size
          let point = CGPoint(x: location.x - screenSize.width * 0.5, y: location.y - screenSize.height * 0.5)
          print("click point: \(point)")
          for slice in slices {
            if let path = slice.path, path.contains(point, eoFill: false) {
              print(slice.name, path.boundingRect)
            }
          }
        }
        .background(Color.orange)

      }
      Spacer()
    }
  }

  func drawRing(by context: inout GraphicsContext) {
    let radius = UIScreen.main.bounds.width * 0.45
    let total = slices.reduce(0) { $0 + $1.value }
    var startAngle = Angle.zero
    for slice in slices {
      let angle = Angle(degrees: 360 * (slice.value / total))
      let endAngle = startAngle + angle

      let path = Path { p in
        p.move(to: .zero)
        p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        p.closeSubpath()
      }

      context.fill(path, with: .color(slice.color))
      context.stroke(path, with: .color(.white), lineWidth: 1)
      startAngle = endAngle
    }
  }
}

struct StatisticsDemo_Previews: PreviewProvider {
  static var previews: some View {
    StatisticsDemo()
  }
}

struct PieModel: Identifiable {
  var id = UUID()
  let color: Color
  let value: Double
  let name: String
  var path: Path? = nil

  static let sample: [PieModel] = [
    .init(color: Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)), value: 10, name: "A"),
    .init(color: Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)), value: 20, name: "B"),
    .init(color: Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)), value: 20, name: "C"),
    .init(color: Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)), value: 40, name: "D"),
    .init(color: Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)), value: 30, name: "E"),
  ]
}
