//
//  LineChart.swift
//  ITime
//
//  Created by 蔡志文 on 5/29/23.
//

import SwiftUI
import Charts

struct LineChart: View {
    var body: some View {
      List {
        Section {
          Chart(sales) { item in
            LineMark(x: .value("name", item.name), y: .value("sales", item.sales))
          }
          .frame(height: 300)

        } header: {
          Text("折线")
        }

        Section {
          Chart(sales) { item in
            LineMark(x: .value("sales", item.sales), y: .value("name", item.name))
              .interpolationMethod(.catmullRom)
          }
          .frame(height: 300)

        } header: {
          Text("折线水平布局")
        }


        Section {
          Chart(salesSeries) { series in
            ForEach(series.salesSummaries) { element in
              LineMark(
                x: .value("Day", element.weekday, unit: .day),
                y: .value("Sales", element.sales)
              )
              .interpolationMethod(.catmullRom)
              .foregroundStyle(by: .value("City", series.city))
              .symbol(by: .value("City", series.city))
            }
          }
          .frame(height: 300)
          .chartYAxis {
            AxisMarks(position: .leading)
          }
          .chartXAxis {
            AxisMarks(values: .stride(by: .day)) { value in
              AxisGridLine().foregroundStyle(.orange)
              AxisValueLabel(format: .dateTime.weekday(), centered: true)
            }
          }
          .chartYScale(domain: 0...110)
          .chartForegroundStyleScale([
            "China": Color.purple,
            "American": Color.pink
          ])
        } header: {
          Text("多条折线")
        }
      }
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
