//
//  AreaChart.swift
//  ITime
//
//  Created by 蔡志文 on 5/29/23.
//

import SwiftUI
import Charts

struct AreaChart: View {
  var body: some View {
    List {
      Section {
        Chart(sales) { item in
          AreaMark(x: .value("name", item.name), y: .value("sales", item.sales))
        }
        .frame(height: 300)

      } header: {
        Text("折线")
      }

      Section {
        Chart(sales) { item in
          AreaMark(x: .value("sales", item.sales), y: .value("name", item.name))
        }
        .frame(height: 300)

      } header: {
        Text("折线水平布局")
      }


      Section {
        Chart(salesSeries) { series in
          ForEach(series.salesSummaries) { element in
            AreaMark(
              x: .value("Day", element.weekday, unit: .day),
              y: .value("Sales", element.sales)
            )
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
      } header: {
        Text("多条折线")
      }
    }
  }
}

struct AreaChart_Previews: PreviewProvider {
  static var previews: some View {
    AreaChart()
  }
}
