//
//  ExpenseTrackerAppApp.swift
//  ExpenseTrackerApp
//
//  Created by 蔡志文 on 11/8/23.
//

import SwiftUI

@main
struct ExpenseTrackerAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Expense.self, Category.self])
    }
}
