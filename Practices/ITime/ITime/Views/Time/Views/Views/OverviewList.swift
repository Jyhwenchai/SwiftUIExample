//
//  OverviewList.swift
//  ITime
//
//  Created by 蔡志文 on 5/10/23.
//

import SwiftUI

struct OverviewList: View {
    var body: some View {
      List(0..<4) { index in
        GeometryReader {
          let size = $0.size
          let persent = Double.random(in: 0..<1)
          let processWidth = persent * size.width
          VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
              Text("睡觉")
                .foregroundColor(Color.black)
              Text("6小时13分钟")
                .font(.caption)
                .foregroundColor(Color.gray)
                .baselineOffset(1)
              Spacer()
              Text(String(format: "%.1f%%", persent * 100))
                .font(.caption)
                .foregroundColor(Color.black.opacity(0.8))
            }
            Capsule()
              .fill(Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)))
              .frame(width: processWidth , height: 8)
          }
        }
        .listRowSeparator(.hidden)
        .frame(height: 40)
      }
      .listStyle(.plain)
    }
}

struct OverviewList_Previews: PreviewProvider {
    static var previews: some View {
        OverviewList()
    }
}
