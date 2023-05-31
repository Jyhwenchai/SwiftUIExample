//
//  BarChat.swift
//  ITime
//
//  Created by 蔡志文 on 5/26/23.
//

import SwiftUI
import Charts

struct BarChart: View {

  var body: some View {
    List {

      Section {
        Chart(sales) { item in
          BarMark(x: .value("name", item.name), y: .value("sales", item.sales), width: .ratio(0.6))
            .cornerRadius(5)
            .opacity(0.8)
        }
        .border(Color.blue)
        .chartPlotStyle(content: { content in
          content.background(Color.blue.opacity(0.2))
        })
        .chartYAxisLabel("Sales", alignment: .leading)
        .frame(height: 300)

      } header: {
        Text("垂直布局")
      }

      Section {
        Chart(sales) { item in
          BarMark(x: .value("sales", item.sales), y: .value("name", item.name))
        }
        .frame(height: 300)
      } header: {
        Text("水平布局")
      }

      Section {
        Chart(sfData) { item in
          BarMark(
            x: .value("Day", item.weekday, unit: .day),
            y: .value("Sales", item.sales)
          )
          .foregroundStyle(Color.purple)
          .annotation(position: .overlay, alignment: .top, spacing: 4) {
            Text("\(item.sales)")
              .foregroundColor(.white)
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
        Text("外观调整")
      }
      Section {
        Chart(salesSeries) { series in
          ForEach(series.salesSummaries) { element in
            BarMark(
              x: .value("Day", element.weekday, unit: .day),
              y: .value("Sales", element.sales)
            )
            .foregroundStyle(by: .value("City", series.city))
            .position(by: .value("sales", series.city), axis: .horizontal)  // 不添加 position 修改器的话默认是 vertical
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
        Text("Axis的不同")
      }
    }
  }
}

struct BarChat_Previews: PreviewProvider {
  static var previews: some View {
    BarChart()
  }
}
