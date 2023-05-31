//
//  TimeLine.swift
//  ITime
//
//  Created by 蔡志文 on 5/19/23.
//

import SwiftUI

struct TimeLine: View {
  @State private var showCalendar: Bool = false
  @State private var selectedDate = Date()
  let centerRadiusRange = 1.0...80.0
  let amRadiusRange = 100.0...120.0
  let pmRadiusRange = 121.0..<140.0

  @State private var circleCenter = CGPoint.zero
  @Binding var timeLineStyle: TimeLineStyle

  var center: CGPoint = .zero

  var body: some View {
    VStack {
      DateSelectHeader(showCalendar: $showCalendar) {

      } after: {

      }

      if timeLineStyle == .circle {
        TimeLineCircleStyle()
      } else {
        TimeLineListStyle()
      }

      Spacer()
    }
    .fullScreenCover(isPresented: $showCalendar, content: {
      VStack {
        OverviewCalendar(selectedDate: $selectedDate, isShow: $showCalendar)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(TransparentBackground())
    })
  }
}

struct TimeLine_Previews: PreviewProvider {
  static var previews: some View {
    TimeLine(timeLineStyle: .constant(.circle))
  }
}


