//
//  MonthFocusChart.swift
//  ITime
//
//  Created by 蔡志文 on 5/30/23.
//

import SwiftUI
import Charts

struct FocusPoint: Identifiable {
  var id = UUID()
  let day: Date
  let value: Int
}

struct MonthFocusChart: View {

  let points: [FocusPoint] = {
    (1...31).map {
      FocusPoint(day: date(2023, 5, $0), value: $0 == 10 ? 10 : 0)
    }
  }()

  let rangePoints: [FocusPoint] = {
    (9...11).map {
      FocusPoint(day: date(2023, 5, $0), value: $0 == 10 ? 10 : 0)
    }
  }()

  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        HStack {
          Text("月度专注统计")
            .font(.system(size: 13))
          Text("本月")
            .font(.system(size: 13))
          Spacer()
          Group {
            Button {

            } label: {
              Image(systemName: "chevron.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8)
                .tint(Color.black.opacity(0.8))
            }

            Button {

            } label: {
              Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8)
                .tint(Color.black.opacity(0.8))
            }
          }
          .padding(.trailing, 10)
        }
        Spacer()
          .frame(height: 15)
        VStack(alignment: .center) {

          Chart {

            RuleMark(y: .value("value", 10))
              .foregroundStyle(Color("medium_blue"))
              .lineStyle(StrokeStyle(lineWidth: 1))

            ForEach(rangePoints) { item in
              AreaMark(
                x: .value("day", item.day, unit: .day),
                y: .value("value", item.value)
              )
              .foregroundStyle(Gradient(colors: [Color("medium_blue"), Color("medium_blue").opacity(0.1)]))
            }

            ForEach(points) { item in
              LineMark(x: .value("day", item.day, unit: .day), y: .value("value", item.value))
                .interpolationMethod(.catmullRom)
                .lineStyle(StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [3, 3], dashPhase: 0))
                .foregroundStyle(Color("medium_blue"))
              PointMark(x: .value("day", item.day, unit: .day), y: .value("value", item.value))
                .symbol {
                  Circle()
                    .strokeBorder(Color.gray.opacity(0.6), lineWidth: 1)
                    .background(
                      Circle()
                        .fill(Color("medium_blue"))
                    )
                    .frame(width: 6, height: 6)
                }
                .annotation(position: .overlay, alignment: .center, spacing: 0) {
                  if item.value == 10 {
                    GeometryReader { proxy in
                      let frame = proxy.frame(in: .global)
//                      Text("2023-05-17\n0分钟")

                      let drawLeftPoint = CGPoint(x: -25, y: 22)
                      let drawRightPoint = CGPoint(x: 5, y: 42)
                      Path { path in
                        path.move(to: CGPoint(x: 3, y: 6))
                        path.addLine(to: CGPoint(x: -2, y: 12))
                        path.addLine(to: CGPoint(x: 8, y: 12))
                        path.closeSubpath()
                      }
                      .foregroundColor(Color.black.opacity(0.5))
                      Text(frame.debugDescription)
                        .frame(width: 80, height: 40)
                        .background(Color.black.opacity(0.6))
                        .font(.caption2)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(5)
                        .position(x: 0, y: 32)
                    }
                  }
                }
            }
          }
          .frame(height: 130)
          .chartXAxis {
            AxisMarks( values: .stride(by: .day, count: 4) ) { value in
              AxisValueLabel(
                format: .dateTime.day(.defaultDigits)
              )
            }
          }
          .chartYAxis{}
          .chartOverlay { proxy in
            GeometryReader { geometry in
              Rectangle().fill(.clear).contentShape(Rectangle())
                .gesture(DragGesture()
                  .onChanged { value in
                    let origin = geometry[proxy.plotAreaFrame].origin
                    let location = CGPoint(
                      x: value.location.x - origin.x,
                      y: value.location.y - origin.y
                    )
                    // Get the x (date) and y (price) value from the location.
                    if let (date, value) = proxy.value(at: location, as: (Date, Int).self) {
                      print(date, value)
                    }
                  }
                )
            }
          }

        }
      }
      .padding(.leading, 10)
      .padding(.vertical, 10)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.white)
    .cornerRadius(10)
    .padding(.horizontal, 10)
  }
  
}

struct MonthFocusChart_Previews: PreviewProvider {
  static var previews: some View {
    MonthFocusChart()
  }
}
