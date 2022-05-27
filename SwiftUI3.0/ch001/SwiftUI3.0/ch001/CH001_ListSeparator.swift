//
//  CH001_ListSeparator.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_ListSeparator: View {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    @State private var users: [User] = []
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<25) { index in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Cell Row \(index)")
                    }
                    .listRowSeparatorTint(.red)
                    .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("List Row Separator")
        }
    }
}

private struct User: Identifiable {
    var id: Int
    var name: String
    var email: String
}

extension User: Codable {}

struct CH001_ListSeparator_Previews: PreviewProvider {
    static var previews: some View {
        CH001_ListSeparator()
    }
}
