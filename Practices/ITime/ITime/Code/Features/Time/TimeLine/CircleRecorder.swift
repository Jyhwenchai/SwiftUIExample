//
//  CircleRecorder.swift
//  ITime
//
//  Created by 蔡志文 on 5/23/23.
//

import SwiftUI

struct TimeScale: Identifiable {
  var id = UUID()
  let startPoint: CGPoint
  let endPoint: CGPoint
  let text: String
  let textPosition: CGPoint
}

struct CircleRecorder: View {

//  let centerRadiusRange = 1.0...80.0
//  let amRadiusRange = 100.0...120.0
//  let pmRadiusRange = 121.0...140.0
  let centerRadiusRange: ClosedRange<CGFloat>
  let amRadiusRange: ClosedRange<CGFloat>
  let pmRadiusRange: ClosedRange<CGFloat>

  let ringWidth: CGFloat
  let maxRingRadius: CGFloat
  let circleRadius: CGFloat

  var hiddenIndicator: Bool

  init(ringWidth: CGFloat, maxRingRadius: CGFloat, circleRadius: CGFloat, hiddenIndicator: Bool = false) {
    self.ringWidth = ringWidth
    self.maxRingRadius = maxRingRadius
    self.circleRadius = circleRadius
    self.hiddenIndicator = hiddenIndicator

    let halfRingWidth = ringWidth / 2.0
    centerRadiusRange = 1.0...circleRadius
    pmRadiusRange = (maxRingRadius - halfRingWidth + 1)...(maxRingRadius + halfRingWidth)
    amRadiusRange = (maxRingRadius - 3.0 * ringWidth)...(maxRingRadius - halfRingWidth)
  }

  @State private var circleCenter = CGPoint.zero

    var body: some View {
      ZStack {
        Circle()
          .stroke(Color.gray.opacity(0.4), lineWidth: ringWidth)
          .frame(width: 2 * maxRingRadius)
          .overlay {
            if !hiddenIndicator {
              GeometryReader { proxy in
                let timeScales = calculateOuterClock(by: proxy.frame(in: .global))
                ForEach(timeScales, id: \.id) { timeScale in
                  Path { path in
                    path.move(to: timeScale.startPoint)
                    path.addLine(to: timeScale.endPoint)
                    path.closeSubpath()
                  }
                  .stroke(Color.gray, lineWidth: 1 / UIScreen.main.scale)
                  Text(timeScale.text)
                    .position(x: timeScale.textPosition.x, y: timeScale.textPosition.y)
                    .font(.caption2)
                    .foregroundColor(Color.gray)
                }
              }
            }
          }

        Circle()
          .trim(from: 0.25, to: 0.9)
          .stroke(Color.gray.opacity(0.45), lineWidth: ringWidth)
          .frame(width: 2 * maxRingRadius)

        Circle()
          .stroke(Color.gray.opacity(0.3), lineWidth: ringWidth)
          .frame(width: 2 * maxRingRadius - 2 * ringWidth)
          .overlay {
            if !hiddenIndicator {
              GeometryReader { proxy in
                let timeScales = calculateInnerClock(by: proxy.frame(in: .global))
                ForEach(timeScales, id: \.id) { timeScale in
                  Path { path in
                    path.move(to: timeScale.startPoint)
                    path.addLine(to: timeScale.endPoint)
                    path.closeSubpath()
                  }
                  .stroke(Color.gray, lineWidth: 1 / UIScreen.main.scale)
                  Text(timeScale.text)
                    .position(x: timeScale.textPosition.x, y: timeScale.textPosition.y)
                    .font(.caption2)
                    .foregroundColor(Color.gray)
                }
              }
            }
          }
        Circle()
          .trim(from: 0, to: 0.75)
          .stroke(Color.gray.opacity(0.3), lineWidth: ringWidth)
          .frame(width: 2 * maxRingRadius - 2 * ringWidth)

        Circle()
          .fill(Color.gray.opacity(0.6))
          .frame(width: circleRadius * 2.0)
      }
      .onTapGesture { location in
        calculateDotCirclePosition(by: location)
      }
      .gesture(
        DragGesture()
          .onChanged({ gesture in
            calculateDotCircleMovePosition(by: gesture.location)
          })
      )
      .overlay {
        if circleCenter != CGPoint.zero {
          Circle()
            .fill(Color.red)
            .frame(width: ringWidth, height: ringWidth)
            .position(x: circleCenter.x, y: circleCenter.y)

          Path { path in
            path.move(to: CGPoint(x: maxRingRadius, y: maxRingRadius))
            path.addLine(to: CGPoint(x: circleCenter.x, y: circleCenter.y))
            path.closeSubpath()
          }
          .stroke(Color.gray, lineWidth: 1 / UIScreen.main.scale)
        }
      }

    }
}

extension CircleRecorder {
  func calculateInnerClock(by frame: CGRect) -> [TimeScale] {
    let circleFrame = frame.insetBy(dx: 10, dy: 10)
    var points: [TimeScale] = []
    let radius = circleFrame.width / 2.0
    let lineLength: CGFloat = 5
    for i in 9..<21 {
      let degree = Double(i * 30)
      let angleInRadians: Double = degree * .pi / 180  // 将角度转换为弧度
      let x1 = cos(angleInRadians) * radius
      let y1 = sin(angleInRadians) * radius

      let innerRadius = radius - lineLength
      let x2 = x1 * innerRadius / radius
      let y2 = y1 * innerRadius / radius

      let textRadius = innerRadius - 6
      let x3 = x1 * textRadius / radius
      let y3 = y1 * textRadius / radius

      let startPoint = CGPoint(x: x1 + radius + 10, y: y1 + radius + 10)
      let endPoint = CGPoint(x: x2 + radius + 10, y: y2 + radius + 10)
      let textPosition = CGPoint(x: x3 + radius + 10, y: y3 + radius + 10)
      let text = i == 9 ? "12" : "\(i - 9)"
      let timeScale = TimeScale(startPoint: startPoint, endPoint: endPoint, text: text, textPosition: textPosition)
      points.append(timeScale)
    }
    return points
  }

  func calculateOuterClock(by frame: CGRect) -> [TimeScale] {
    let circleFrame = frame.insetBy(dx: -10, dy: -10)
    var points: [TimeScale] = []
    let radius = circleFrame.width / 2.0
    let lineLength: CGFloat = 5
    for i in 9..<21 {
      let degree = Double(i * 30)
      let angleInRadians: Double = degree * .pi / 180  // 将角度转换为弧度
      let x1 = cos(angleInRadians) * radius
      let y1 = sin(angleInRadians) * radius

      let innerRadius = radius + lineLength
      let x2 = x1 * innerRadius / radius
      let y2 = y1 * innerRadius / radius

      let textRadius = innerRadius + 6
      let x3 = x1 * textRadius / radius
      let y3 = y1 * textRadius / radius

      let startPoint = CGPoint(x: x1 + radius - 10, y: y1 + radius - 10)
      let endPoint = CGPoint(x: x2 + radius - 10, y: y2 + radius - 10)
      let textPosition = CGPoint(x: x3 + radius - 10, y: y3 + radius - 10)
      let text = i == 9 ? "24" : "\(i - 9 + 12)"
      let timeScale = TimeScale(startPoint: startPoint, endPoint: endPoint, text: text, textPosition: textPosition)
      points.append(timeScale)
    }
    return points
  }

  func calculateDotCircleMovePosition(by location: CGPoint) {
    let referenceRadius = 130.0 // 参考半径
    let x = location.x - referenceRadius
    let y = -(location.y - referenceRadius)
    let pointRadius = sqrt(x * x + y * y) // 点击点的半径

    var r = referenceRadius
    if pointRadius <= 110 {
      r = 110   // 内圈半径
    } else {
      r = 130   // 外圈半径
    }

    if r == 0 {
      circleCenter = CGPoint.zero
    } else {
      var circleX = r * x / pointRadius
      var circleY = r * y / pointRadius
      circleX += referenceRadius
      circleY = -(circleY - referenceRadius)
      circleCenter = CGPoint(x: circleX, y: circleY)
    }
  }

  func calculateDotCirclePosition(by location: CGPoint) {
    let referenceRadius = 130.0 // 参考半径
    let x = location.x - referenceRadius
    let y = -(location.y - referenceRadius)
    let pointRadius = sqrt(x * x + y * y) // 点击点的半径

    var r = referenceRadius
    if centerRadiusRange ~= pointRadius {
      r = 0
      print("center circle click event.")
    } else if amRadiusRange ~= pointRadius {
      r = 110   // 内圈半径
    } else if pmRadiusRange ~= pointRadius {
      r = 130   // 外圈半径
    } else {
      r = 0
    }

    if r == 0 {
      circleCenter = CGPoint.zero
    } else {
      var circleX = r * x / pointRadius
      var circleY = r * y / pointRadius
      circleX += referenceRadius
      circleY = -(circleY - referenceRadius)
      circleCenter = CGPoint(x: circleX, y: circleY)
    }
  }
}

struct CircleRecorder_Previews: PreviewProvider {
    static var previews: some View {
      CircleRecorder(ringWidth: 20, maxRingRadius: 130, circleRadius: 75)
    }
}

