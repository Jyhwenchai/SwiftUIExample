//
//  SearchCompletion.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct SearchCompletionView: View {
  @State private var searchText: String = ""
  @State private var isPresented: Bool = false
  var departments: [Department] {
    if searchText.isEmpty { return Department.departments }
    return Department.departments.filter { $0.name.contains(searchText) }
  }
  var body: some View {
    NavigationStack {
      List {
        ForEach(departments) { department in
          Text(department.name)
        }
      }
      .navigationTitle("Searchable")
      .searchable(text: $searchText) {
        Text("🍎").searchCompletion("apple")
        Text("🍐").searchCompletion("pear")
        Text("🍌").searchCompletion("banana")
      }
    }
  }
}

#Preview {
    SearchCompletionView()
}
