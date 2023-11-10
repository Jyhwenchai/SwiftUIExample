//
//  Expense.swift
//  ExpenseTrackerApp
//
//  Created by 蔡志文 on 11/8/23.
//

import SwiftUI
import SwiftData

@Model
class Expense {
  var title: String
  var subTitle: String
  var amount: Double
  var date: Date
  var category: Category?

  init(title: String, subTitle: String, amount: Double, date: Date, category: Category? = nil) {
    self.title = title
    self.subTitle = subTitle
    self.amount = amount
    self.date = date
    self.category = category
  }

  /// currency String
  var currencyString: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(for: amount) ?? ""
  }
}
