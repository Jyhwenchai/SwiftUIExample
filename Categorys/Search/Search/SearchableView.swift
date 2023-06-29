//
//  SearchableVoew.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct SearchableView: View {
  @State private var searchText: String = ""
  @State private var isPresented: Bool = false
  @State private var tokens = Token.allCases
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
      .searchable(text: $searchText)
      // 通过 `isPresentea` 触发搜索
//      .searchable(text: $searchText, isPresented: $isPresented, prompt: "Search Department")
      // provide tokens
      .toolbar {
        ToolbarItem {
          Button("search") {
            isPresented.toggle()
          }
        }
      }
    }
  }
}

#Preview {
  SearchableView()
}
