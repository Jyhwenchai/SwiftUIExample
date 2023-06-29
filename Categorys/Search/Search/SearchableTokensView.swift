//
//  SearchableTokensView.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct SearchableTokensView: View {
  @State private var searchText: String = ""
  @State private var tokens = [Token.apple]
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
      // provide tokens
//      .searchable(text: $searchText, tokens: $tokens) { token in
//        Text(token.rawValue)
//      }
      .searchable(text: $searchText, editableTokens: $tokens) { $token in
        Text(token.rawValue)
      }
//      .searchable(text: $searchText, tokens: $tokens, suggestedTokens: $tokens) { token in
//        Text(token.rawValue)
//      }
    }
  }
}

#Preview {
    SearchableTokensView()
}
