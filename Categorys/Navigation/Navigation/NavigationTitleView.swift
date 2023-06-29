//
//  NavigationTitle.swift
//  Navigation
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct NavigationTitleView: View {
    var body: some View {
      NavigationStack {
        List {
          ForEach(0..<10, id: \.self) { index in
            Text("Cell \(index)")
          }
        }
        .navigationTitle("List")
      }
    }
}

#Preview {
    NavigationTitleView()
}
