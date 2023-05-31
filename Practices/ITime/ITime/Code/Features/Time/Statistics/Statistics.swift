//
//  Statistics.swift
//  ITime
//
//  Created by 蔡志文 on 5/25/23.
//

import SwiftUI
import SwiftPieChart

struct Statistics: View {
    var body: some View {
      PieChartView(
          values: [1300, 500, 300],
          names: ["Rent", "Transport", "Education"],
          formatter: { value in String(format: "$%.2f", value) },
          backgroundColor: .white,
          widthFraction: 0.8)
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
