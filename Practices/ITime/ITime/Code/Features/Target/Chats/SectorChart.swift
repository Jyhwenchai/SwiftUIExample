//
//  SectorChart.swift
//  ITime
//
//  Created by 蔡志文 on 6/6/23.
//

import SwiftUI
import Charts

struct SectorChart: View {

  @State private var selectedSales: Int? = 900
  let total = sales.reduce(0.0) { $0 + $1.sales }

  var cumulativeSalesRangesForStyles: [(name: String, range: Range<Double>)]

  var selectedStyle: Pancakes? {
    if let selectedSales,
       let selectedIndex = cumulativeSalesRangesForStyles
      .firstIndex(where: { $0.range.contains(Double(selectedSales)) }) {
      return sales[selectedIndex]
    }

    return nil
  }

  init() {
    var cumulative = 0.0
    self.cumulativeSalesRangesForStyles = sales.map {
      let newCumulative = cumulative + $0.sales
      let result = (name: $0.name, range: cumulative ..< newCumulative)
      cumulative = newCumulative
      return result
    }
  }

  var body: some View {
    VStack {
      Chart(sales, id: \.name) { item in
        SectorMark(
          angle: .value("Sales", item.sales),
          innerRadius: .ratio(0.528),
          outerRadius: .ratio(selectedStyle?.name == item.name ? 1 : 0.97),
          angularInset: 1.5
        )
        .cornerRadius(5)
        .foregroundStyle(item.color)
        .foregroundStyle(by: .value("Name", item.name))
        .opacity(selectedStyle?.name == item.name ? 1 : 0.25)
        .annotation(position: .overlay, alignment: .center) { context in
          let persent = Double(item.sales) / total
          Text(String(format: "%.2f%%", persent * 100))
            .foregroundStyle(Color.white)
            .font(.callout)
        }
      }
      .padding(.horizontal, 50)
      .frame(height: 400)
      .chartBackground(alignment: .center) { proxy in
        GeometryReader { geometry in
          let frame = geometry[proxy.plotAreaFrame]
          VStack {
            Text("Most Sold Style")
              .font(.callout)
              .foregroundStyle(.secondary)
            Text("China")
              .font(.title2.bold())
              .foregroundStyle(.primary)
          }
          .position(x: frame.midX, y: frame.midY)
        }
      }
      .chartLegend(position: .bottom, alignment: .center, spacing: 10)
      .chartAngleSelection($selectedSales)
      .chartGesture { proxy in
        DragGesture(minimumDistance: 0)
          .onChanged { value in

//            let value = proxy.value(at: value.location, as: (String, Int).self)
            print(value)
          }
          .onEnded { value in
            print(value)
          }
      }
    }
  }
}

#Preview {
    SectorChart()
}
