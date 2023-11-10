//
//  AddExpenseView.swift
//  ExpenseTrackerApp
//
//  Created by 蔡志文 on 11/8/23.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context

  @State private var title: String = ""
  @State private var subTitle: String = ""
  @State private var date: Date = .init()
  @State private var amount: CGFloat = 0
  @State private var category: Category?
  @Query(animation: .snappy) private var allCategories: [Category]
  var body: some View {
    NavigationStack {
      List {
        Section("Title") {
          TextField("Magic Keyboard", text: $title)
        }

        Section("Description") {
          TextField("Bought a keyboard at the Apple Store", text: $subTitle)
        }

        Section("Amount Spent") {
          HStack(spacing: 4) {
            Text("$")
              .fontWeight(.semibold)
            TextField("0.0", value: $amount, formatter: formatter)
              .keyboardType(.numberPad)
          }
        }

        Section("Date") {
          DatePicker("", selection: $date, displayedComponents: [.date])
            .datePickerStyle(.graphical)
            .labelsHidden()
        }

        if !allCategories.isEmpty {
          HStack {
            Text("Category")
            Spacer()

            Menu {
              ForEach(allCategories) { category in
                Button(category.categoryName) {
                  self.category = category
                }
              }

              Button("none") {
                category = nil
              }
            } label: {
              if let categoryName = category?.categoryName {
                Text(categoryName)
              } else {
                Text("None")
              }
            }
//            Picker("", selection: $category) {
//              ForEach(allCategories) {
//                Text($0.categoryName)
//                  .tag($0)
//              }
//            }
//            .pickerStyle(.menu)
//            .labelsHidden()
          }
        }
      }
      .navigationTitle("Add Expense")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
          .tint(.red)
        }

        ToolbarItem(placement: .topBarTrailing) {
          Button("Add") {
            addExpense()
          }
          .disabled(isAddButtonDisabled)
        }
      }
    }
  }

  var isAddButtonDisabled: Bool {
    return title.isEmpty || subTitle.isEmpty || amount == .zero
  }

  func addExpense() {
    let expense = Expense(title: title, subTitle: subTitle, amount: amount, date: date, category: category)
    context.insert(expense)
    dismiss()
  }

  var formatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    return formatter
  }
}

