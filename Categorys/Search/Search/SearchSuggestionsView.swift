//
//  SearchSuggestionsView.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct SearchSuggestionsView: View {
  @State private var searchText: String = ""
  @State private var isPresented: Bool = false
  
  @State private var suggestedTokens: [Token] = Token.allCases

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
        ForEach(suggestedTokens) { suggestion in
          Text(suggestion.rawValue)
            .searchCompletion(suggestion.rawValue.uppercased())
        }
//        .searchSuggestions(.hidden, for: .content)
      }
    }
  }
}

#Preview {
  SearchSuggestionsView()
}
