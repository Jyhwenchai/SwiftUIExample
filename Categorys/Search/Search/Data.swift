//
//  Data.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI
let data: [(String, [Feature])] = [
 ("Search",
  [
    .init("Searchable", SearchableBasicView()),
    .init("SearchableTokens", SearchableTokensView()),
    .init("SearchSugggestions", SearchSuggestionsView()),
    .init("SearchCompletion", SearchCompletionView()),
  ]
 ),
 ("Detecting, activating, and dismissing search",
  [
    .init("isSearching", IsSearchingView()),
    .init("dismissSearch", DismissSearchView())
  ]
 )
]

struct Feature: Identifiable {
  let title: String
  let view: AnyView
  var id: String { title }
  init(_ title: String, _ view: some View) {
    self.title = title
    self.view = AnyView(view)
  }
}

extension Color {
  static var random: Color { Color(
    red: Double.random(in: 0..<1),
    green: Double.random(in: 0..<1),
    blue: Double.random(in: 0..<1))
  }
}

struct Department: Identifiable {
  var id = UUID()
  var name: String
  var products: [Product]
}

struct Product: Identifiable {
  var id = UUID()
  var name: String
}

extension Department {
  static let departments: [Department] = (0..<5).map { i in
    Department(
      name: "Department \(i)",
      products:
        (0..<5).map { j in
          .init(name: "department:\(i)-product:\(j)")
        }
    )
  }
}

enum Token: String, Identifiable, CaseIterable {
  case apple
  case orange
  case banana
  case grape
  var id: Self { self }
}
