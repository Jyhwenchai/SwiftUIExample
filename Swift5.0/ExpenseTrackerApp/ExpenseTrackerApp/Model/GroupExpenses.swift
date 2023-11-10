//
//  GroupExpenses.swift
//  ExpenseTrackerApp
//
//  Created by 蔡志文 on 11/8/23.
//

import SwiftUI

struct GroupedExpenses: Identifiable {
  var id: UUID = .init()
  var date: Date
  var expenses: [Expense]

  var groupTitle: String {
    let calendar = Calendar.current

    if calendar.isDateInToday(date) {
      return "Today"
    } else if calendar.isDateInYesterday(date) {
      return "Yesterday"
    } else {
      return date.formatted(date: .abbreviated, time: .omitted)
    }
  }
}
