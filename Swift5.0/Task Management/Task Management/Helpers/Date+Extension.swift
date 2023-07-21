//
//  Date+Extension.swift
//  Task Management
//
//  Created by 蔡志文 on 7/19/23.
//

import SwiftUI

extension Date {
  func format(_ format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: self)
  }

  var isToday: Bool {
    return Calendar.current.isDateInToday(self)
  }

  var isSameHour: Bool {
    return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
  }

  var isPast: Bool {
    return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
  }

  /// 获取给定日期的一周
  func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
    let calendar = Calendar.current
    // 获取给定日期当前的第一时刻（0点）
    let startOfDate = calendar.startOfDay(for: date)

    var week: [WeekDay] = []
    // 获取给定日期所在的周范围
    let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
    // 获取给定日期所处周的开始的一天
    guard let startOfWeek = weekForDate?.start else {
      return []
    }

    (0..<7).forEach { index in
      if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek) {
        week.append(.init(date: weekDay))
      }
    }

    return week
  }

  /// 获取下一周
  func createNextWeek() -> [WeekDay] {
    let calendar = Calendar.current
    let startOfLastDate = calendar.startOfDay(for: self)
    guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else {
      return []
    }
    return fetchWeek(nextDate)
  }

  /// 获取上一周
  func createPreviousWeek() -> [WeekDay] {
    let calendar = Calendar.current
    let startOfFirstDate = calendar.startOfDay(for: self)
    guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOfFirstDate) else {
      return []
    }
    return fetchWeek(previousDate)
  }

  struct WeekDay: Identifiable {
    var id: UUID = .init()
    var date: Date
  }

}
