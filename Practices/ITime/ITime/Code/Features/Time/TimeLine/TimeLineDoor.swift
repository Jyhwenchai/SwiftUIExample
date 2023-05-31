//
//  TimeLineDoor.swift
//  ITime
//
//  Created by 蔡志文 on 5/23/23.
//

import SwiftUI

struct TimeLineDoor: View {
    var body: some View {
      VStack {
          GeometryReader { proxy in
            let size = proxy.size
            let margin: CGFloat = 110
            let strokeRadius: CGFloat = 17
            ZStack {
              let radius = (size.width - 2 * margin) * 0.5
              let rect = CGRect(x: 0, y: 0, width: 2 * radius, height: 2 * radius)
              Path { path in
                path.addRoundedRect(in: rect, cornerSize: CGSize(width: radius, height: radius))
                path.closeSubpath()
              }
              .offsetBy(dx: margin, dy: margin)
              .foregroundColor(Color.orange)
              .overlay {
                Text("\(proxy.frame(in: .global).debugDescription)")
                  .position(x: 0, y: 0)
              }

              let arcMargin: CGFloat = 60
              let arcRadius = (size.width - 2 * arcMargin) * 0.5
              let arcLength = arcRadius * CGFloat.pi
              let edgeLength = (size.height - 100) * 2
              let distance = (arcLength + edgeLength) / 24.0

              Path { path in
                let center = CGPoint(x: size.width * 0.5, y: size.width * 0.5)
                path.addArc(center: center, radius: arcRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
              }
              .stroke(lineWidth: 34)
              .foregroundColor(Color.orange)
              .overlay {
//                Text("\(proxy.frame(in: .global).debugDescription)")
                VStack {
                  Text("\(arcLength)")
                  Text("\(edgeLength)")
                  Text("\(distance)")
                }
              }

              Path { path in
                path.move(to: CGPoint(x: arcMargin, y: size.height - 100))
                path.addLine(to: CGPoint(x: arcMargin, y: size.width * 0.5))
                path.closeSubpath()
              }
              .stroke(lineWidth: 2 * strokeRadius)
              .foregroundColor(Color.orange)

              Path { path in
                path.move(to: CGPoint(x: size.width - arcMargin, y: size.height - 100))
                path.addLine(to: CGPoint(x: size.width - arcMargin, y: size.width * 0.5))
                path.closeSubpath()
              }
              .stroke(lineWidth: 2 * strokeRadius)
              .foregroundColor(Color.orange)

              Path { path in
                path.move(to: CGPoint(x: arcMargin - strokeRadius, y: size.height - 100))
                path.addLine(to: CGPoint(x: arcMargin - strokeRadius - 5, y: size.height - 100))
              }
              .stroke(lineWidth: 1)
              .foregroundColor(Color.gray.opacity(0.6))
              .overlay {
                Text("0")
                  .font(.caption2)
                  .position(x: arcMargin - strokeRadius - 14, y: size.height - 100)
              }
            }
          }
        Spacer()
      }
    }
}

struct TimeLineDoor_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineDoor()
    }
}
