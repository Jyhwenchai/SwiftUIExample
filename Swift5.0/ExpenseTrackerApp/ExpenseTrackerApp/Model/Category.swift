//
//  Category.swift
//  ExpenseTrackerApp
//
//  Created by 蔡志文 on 11/8/23.
//

import SwiftUI
import SwiftData

@Model
class Category {
  var categoryName: String
  @Relationship(deleteRule: .cascade, inverse: \Expense.category)
  var expenses: [Expense]?
  init(categoryName: String) {
    self.categoryName = categoryName
  }
}

