//
//  RuleChart.swift
//  ITime
//
//  Created by 蔡志文 on 5/29/23.
//

import SwiftUI
import Charts

struct RuleChart: View {
  var body: some View {
    List {
      Chart {
        ForEach(sales) { item in
          BarMark(x: .value("name", item.name), y: .value("sales", item.sales))
        }
        RuleMark(y: .value("break line", 450))
          .lineStyle(StrokeStyle(lineWidth: 3))
          .foregroundStyle(.green)
          .annotation(alignment: .leading) {
            Text("Average")
              .foregroundColor(.orange)
          }
      }

      Chart {
        ForEach(sales) { item in
          BarMark(x: .value("sales", item.sales), y: .value("name", item.name))
        }
        RuleMark(x: .value("break line", 450))
          .foregroundStyle(.green)
      }
      .frame(height: 300)
    }
  }
}

struct RuleChart_Previews: PreviewProvider {
  static var previews: some View {
    RuleChart()
  }
}
