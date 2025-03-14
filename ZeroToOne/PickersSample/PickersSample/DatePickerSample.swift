//
//  DatePickerSample.swift
//  PickersSample
//
//  Created by 蔡志文 on 1/15/25.
//

import SwiftUI

enum DatePickerStyleEnum: String, Identifiable, CaseIterable {
  var id: Self { self }
  case auto
  case compact
  case graphical
  case wheel
}

struct DatePickerSample: View {
  @State private var selectedDate: Date = .now
  @State private var style: DatePickerStyleEnum = .auto
  let dateRange: ClosedRange<Date> = {
    let calendar = Calendar.current
    let startComponents = DateComponents(year: 2021, month: 1, day: 1)
    let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
    return calendar.date(from:startComponents)!
    ...
    calendar.date(from:endComponents)!
  }()
  var body: some View {
    Form {
      Picker("Date Picker Style", selection: $style) {
        ForEach(DatePickerStyleEnum.allCases) { style in
          Text(style.rawValue.capitalized)
        }
      }
      .pickerStyle(.segmented)
      DatePicker("selected date", selection: $selectedDate)
        .modifier(CustomDatePickerStyle(style: style))

      DatePicker("Selected Date", selection: $selectedDate, displayedComponents: [.date])
      DatePicker(selection: $selectedDate) {
        Text("Start Date")
        Text("Select the starting date for the event")
      }
      DatePicker(
        "Start Date",
        selection: $selectedDate,
        in: dateRange,
        displayedComponents: [.date, .hourAndMinute]
      )
    }
  }
}

#Preview {
    DatePickerSample()
}

struct CustomDatePickerStyle: ViewModifier {
  let style: DatePickerStyleEnum
  func body(content: Content) -> some View {
    switch style {
    case .auto:
      content
        .datePickerStyle(.automatic)
    case .compact:
      content
        .datePickerStyle(.compact)
    case .graphical:
      content
        .datePickerStyle(.graphical)
    case .wheel:
      content
        .datePickerStyle(.wheel)
    }
  }
}
