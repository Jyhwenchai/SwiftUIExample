//
//  IsSearchingView.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct IsSearchingView: View {
  @State private var searchText = ""

  var body: some View {
    NavigationStack {
      SearchedView()
        .searchable(text: $searchText)
    }
  }


  struct SearchedView: View {
    @Environment(\.isSearching) private var isSearching

    var body: some View {
      Text(isSearching ? "Searching!" : "Not searching.")
    }
  }
}

#Preview {
    IsSearchingView()
}
