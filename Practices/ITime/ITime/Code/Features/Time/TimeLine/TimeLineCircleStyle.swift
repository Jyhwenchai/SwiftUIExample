//
//  TimeLineCircleStyle.swift
//  ITime
//
//  Created by 蔡志文 on 5/24/23.
//

import SwiftUI

struct TimeLineCircleStyle: View {
  var body: some View {
    List {
      HStack {
        Spacer()
        CircleRecorder(ringWidth: 20, maxRingRadius: 130, circleRadius: 75)
          .padding(20)
          .padding(.bottom, 20)
        Spacer()
      }
      .listRowSeparator(.hidden)
      ForEach(0..<3) { index in
        TimeLineCircleRecorderCell()
          .frame(height: 38)
          .listRowSeparator(.hidden)
      }
    }
    .listStyle(.plain)
  }
}

struct TimeLineCircleStyle_Previews: PreviewProvider {
  static var previews: some View {
    TimeLineCircleStyle()
  }
}
