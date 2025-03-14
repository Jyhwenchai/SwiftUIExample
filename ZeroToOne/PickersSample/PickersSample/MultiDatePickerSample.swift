//
//  MultiDatePickerSample.swift
//  PickersSample
//
//  Created by 蔡志文 on 1/15/25.
//

import SwiftUI

struct MultiDatePickerSample: View {
  @Environment(\.calendar) var calendar
  @Environment(\.timeZone) var timeZone
  var bounds: Range<Date> {
    let start = calendar.date(from: DateComponents(
      timeZone: timeZone, year: 2022, month: 6, day: 6))!
    let end = calendar.date(from: DateComponents(
      timeZone: timeZone, year: 2029, month: 6, day: 16))!
    return start ..< end
  }

  @State private var dates: Set<DateComponents> = []
  init() {
    UITableView.appearance().sectionHeaderTopPadding = 0
    UITableView.appearance().contentInset = .zero
  }

  var body: some View {
    MultiDatePicker("Dates Available", selection: $dates, in: bounds)
      .frame(maxHeight:.leastNonzeroMagnitude)
  }
}

#Preview {
  MultiDatePickerSample()
}
