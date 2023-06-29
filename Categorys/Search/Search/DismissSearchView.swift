//
//  DismissSearchView.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct DismissSearchView: View {
  @State private var searchText = ""

  var body: some View {
    NavigationStack {
      SearchedView(searchText: searchText)
        .searchable(text: $searchText)
    }
  }

  private struct SearchedView: View {
    let searchText: String

    let items = ["a", "b", "c"]
    var filteredItems: [String] { items.filter { $0 == searchText.lowercased() } }

    @State private var isPresented = false
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View {
      if let item = filteredItems.first {
        Button("Details about \(item)") {
          isPresented = true
        }
        .sheet(isPresented: $isPresented) {
          NavigationStack {
            DetailView(item: item, dismissSearch: dismissSearch)
          }
        }
      }
    }
  }

  private struct DetailView: View {
    var item: String
    var dismissSearch: DismissSearchAction

    @Environment(\.dismiss) private var dismiss

    var body: some View {
      Text("Information about \(item).")
        .toolbar {
          Button("Add") {
            // Store the item here...
            dismiss()
            // 结束搜索
            dismissSearch()
          }
        }
    }
  }
}

#Preview {
  DismissSearchView()
}
